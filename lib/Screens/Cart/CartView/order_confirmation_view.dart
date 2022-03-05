import 'package:eshop/Screens/Cart/bloc/index.dart';
import 'package:eshop/Screens/CommonWidgets/app_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderConfirmationView extends StatelessWidget {
  const OrderConfirmationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
        builder: (c, state) {
          return Center(
            child: Column(
              children: [
                Row(
                  children: const [
                    AppTitle(title: "Order Placed successfully"),
                    Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 30,
                    ),
                  ],
                ),
                if (state is PaymentSuccessState)
                  Row(
                    children: const [
                      AppTitle(title: "Payment successfull"),
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 30,
                      ),
                    ],
                  ),
                if (state is PaymentErrorState)
                  Row(
                    children: const [
                      AppTitle(title: "Payment error"),
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 30,
                      ),
                    ],
                  ),
              ],
            ),
          );
        },
        listener: (c, state) {});
  }
}
