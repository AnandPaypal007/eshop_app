import 'package:eshop/Screens/Cart/bloc/index.dart';
import 'package:eshop/Screens/CommonWidgets/app_title.dart';
import 'package:eshop/Utils/app_animator.dart';
import 'package:eshop/Utils/app_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderConfirmationView extends StatelessWidget {
  const OrderConfirmationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
        builder: (c, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const AppAnimatorView(type: AppAnnimation.orderPlaced,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                  mainAxisAlignment: MainAxisAlignment.center,
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AppTitle(
                        title: "Payment Failed, do you want to try again?"),
                    IconButton(
                      icon: const Icon(
                        Icons.repeat,
                        color: Colors.red,
                        size: 30,
                      ),
                      onPressed: () => _retryPayment(context),
                    )
                  ],
                ),
            ],
          );
        },
        bloc: BlocProvider.of<CartBloc>(context),
        listener: (c, state) {});
  }

  _retryPayment(context) {
    BlocProvider.of<CartBloc>(context).add(MakePaymentEvent());
  }
}
