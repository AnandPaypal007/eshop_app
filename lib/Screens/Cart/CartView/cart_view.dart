import 'package:eshop/Models/cart.dart';
import 'package:eshop/Screens/Cart/CartView/cart_cell.dart';
import 'package:eshop/Screens/Cart/bloc/cart_bloc.dart';
import 'package:eshop/Screens/Cart/bloc/cart_state.dart';
import 'package:eshop/Screens/CommonWidgets/app_loader.dart';
import 'package:eshop/Screens/CommonWidgets/app_price.dart';
import 'package:eshop/Screens/CommonWidgets/app_round_button.dart';
import 'package:eshop/Screens/CommonWidgets/app_title.dart';
import 'package:eshop/Utils/apptheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartBloc bloc = BlocProvider.of<CartBloc>(context);

    return BlocConsumer(
      builder: (c, state) {
        if (state is CartLoadingState || state is CartDefaultState) {
          return const AppLoader();
        } else if (state is CartFetchingDoneState) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.only(top: 10),
                    itemBuilder: (c, index) {
                      final MCart cart = bloc.repo.product[index];
                      return CartCell(
                        cart: cart,
                      );
                    },
                    itemCount: bloc.repo.count),
              ),
              Container(
                height: 100,
                padding: const EdgeInsets.all(10),
                color: AppColors.darkBlue,
                child: Row(
                  children: [
                    AppPrice(
                      price: bloc.repo.cartTotal(),
                      titel: "Total \t",
                      color: Colors.white,
                    ),
                    const Spacer(),
                    AppRoundButton(
                      title: "Place Order",
                      onPressed: () {},
                    )
                  ],
                ),
              )
            ],
          );
        } else {
          return Container();
        }
      },
      listener: (c, state) {},
      bloc: bloc,
    );
  }
}
