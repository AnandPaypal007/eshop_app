import 'package:eshop/Screens/CommonWidgets/app_loader.dart';
import 'package:eshop/Screens/CommonWidgets/app_price.dart';
import 'package:eshop/Screens/CommonWidgets/app_title.dart';
import 'package:eshop/Screens/Home/Views/view_all.dart';
import 'package:eshop/Screens/Home/bloc/home_repo.dart';
import 'package:eshop/Screens/Home/bloc/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeHorizontalList extends StatefulWidget {
  final String? title;
  const HomeHorizontalList({Key? key, this.title}) : super(key: key);

  @override
  State<HomeHorizontalList> createState() => _HomeHorizontalListState();
}

class _HomeHorizontalListState extends State<HomeHorizontalList> {
  HomeBloc? bloc;

  @override
  void initState() {
    super.initState();
    bloc = HomeBloc(HomeDefaultState(), HomeRepo());
    bloc?.add(LoadDealsEvent(type: "latest"));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      builder: (c, state) {
        if (state is HomeLoadingState || state is HomeDefaultState) {
          return const AppLoader();
        } else if (state is OffersDoneState) {
          final products = bloc?.repo.products;
          return Column(
            children: [
              ViewAll(
                title: widget.title,
              ),
              Container(
                height: 160,
                // margin: const EdgeInsets.all(5),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (c, index) {
                    final product = products![index];
                    return Card(
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        height: 150,
                        width: 100,
                        child: Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.network(
                                      product.logo ?? "",
                                      height: 90,
                                    ),
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 5.0),
                                  child: Divider(
                                    height: 1,
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                  child: AppTitle(
                                    title: product.name,
                                    maxLines: 2,
                                    fontSize: 10,
                                    textAlign: TextAlign.start,
                                    padding: const EdgeInsets.only(bottom: 5),
                                  ),
                                ),
                                AppPrice(
                                  price: product.price!,
                                  titel: "Rs: ",
                                )
                              ],
                            ),
                            const Positioned(
                              child: AppTitle(
                                title: "30%",
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                              right: 0,
                              top: 0,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: products?.length ?? 0,
                ),
              ),
              const Divider()
            ],
          );
        } else {
          return const AppLoader();
        }
      },
      bloc: bloc,
    );
  }
}
