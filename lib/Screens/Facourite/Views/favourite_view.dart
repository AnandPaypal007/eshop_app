import 'package:eshop/Models/product.dart';
import 'package:eshop/Screens/CommonWidgets/app_loader.dart';
import 'package:eshop/Screens/Facourite/bloc/favourite_bloc.dart';
import 'package:eshop/Screens/Facourite/bloc/favourite_state.dart';
import 'package:eshop/Screens/Home/Views/product_grid_card_view.dart';
import 'package:eshop/Screens/Products/Views/product_details.dart';
import 'package:eshop/Utils/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class FavouriteView extends StatelessWidget {
  const FavouriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<FavouriteBloc>(context);
    return BlocConsumer(
      bloc: bloc,
      builder: (context, state) {
        if (state is FavouriteLooadingState) return const AppLoader();
        return GridView.builder(
          itemBuilder: (context, position) {
            final MProducts product = bloc.repo.productFor(position);
            return GestureDetector(
              onTap: () {
                AppNavigator.productDetail(id: product.id);
              },
              child: ProductCardView(
                product: product,
              ),
            );
          },
          itemCount: bloc.repo.favouriteCount,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 272.0, crossAxisCount: kIsWeb ? 8 : 2),
        );
      },
      listener: (c, state) {},
    );
  }
}
