import 'dart:async';

import 'package:eshop/Models/product.dart';
import 'package:eshop/Screens/CommonWidgets/app_price.dart';
import 'package:eshop/Screens/CommonWidgets/app_textfield.dart';
import 'package:eshop/Screens/CommonWidgets/app_title.dart';
import 'package:eshop/Screens/Search/bloc/index.dart';
import 'package:eshop/Screens/Search/bloc/search_bloc.dart';
import 'package:eshop/Utils/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatefulWidget {
  const SearchView({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  Timer? debounce;
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<SearchBloc>(context);
    return BlocConsumer(
      builder: (c, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 45,
                child: AppTextField(
                  onChange: (c) {
                    if (debounce?.isActive ?? false) debounce?.cancel();
                    debounce = Timer(const Duration(milliseconds: 500), () {
                      bloc.add(LoadSearchEvent(text: c));
                      // do something with query
                    });
                  },
                ),
              ),
            ),
            if (bloc.repo.favouriteCount > 0)
              Expanded(
                child: ListView.builder(
                  itemBuilder: (c, index) {
                    final MProducts product = bloc.repo.productFor(index);
                    return GestureDetector(
                      onTap: () => AppNavigator.productDetail(
                          id: product.id,),
                      child: Card(
                        margin: const EdgeInsets.all(10),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Image.network(
                                product.logo ?? "",
                                height: 50,
                                width: 50,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppTitle(
                                      title: product.name,
                                      padding: const EdgeInsets.only(bottom: 5),
                                    ),
                                    Row(
                                      children: [
                                        AppPrice(
                                          titel: "Rs: ",
                                          price: product.offerPrice ?? 0.0,
                                        ),
                                        const Spacer(),
                                        AppPrice(
                                          titel: "Rs: ",
                                          price: product.price ?? 0.0,
                                          isLineThrough: true,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: bloc.repo.favouriteCount,
                ),
              ),
          ],
        );
      },
      listener: (c, state) {},
      bloc: BlocProvider.of<SearchBloc>(context),
    );
  }

  @override
  void dispose() {
    debounce?.cancel();
    super.dispose();
  }
}
