import 'package:eshop/Models/cart.dart';
import 'package:eshop/Screens/Cart/CartView/cart_quantity_view.dart';
import 'package:eshop/Screens/Cart/bloc/index.dart';
import 'package:eshop/Screens/CommonWidgets/app_price.dart';
import 'package:eshop/Screens/CommonWidgets/app_stepper.dart';
import 'package:eshop/Screens/CommonWidgets/app_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCell extends StatelessWidget {
  final MCart? cart;
  const CartCell({Key? key, this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartBloc bloc = BlocProvider.of<CartBloc>(context);

    return Container(
      height: 110,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(
        left: 10,
        right: 10,
        bottom: 10,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
              child: AppTitle(
            textAlign: TextAlign.left,
            title: cart!.name,
            maxLines: 2,
          )),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        AppPrice(
                          price: cart!.offerPrice!,
                          titel: "Rs: ",
                          padding: const EdgeInsets.only(right: 10),
                        ),
                        AppPrice(
                          price: cart!.price!,
                          isLineThrough: true,
                          titel: "Rs: ",
                        ),
                      ],
                    ),
                    // const Spacer(),
                    if (cart != null)
                      CartQuantityView(
                        cart: cart,
                      ),
                  ],
                ),
                const Spacer(),
                Image.network(
                  cart!.logo ?? "",
                  width: 100,
                  height: 60,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
