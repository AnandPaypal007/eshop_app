import 'package:eshop/Screens/Profile/Orders/Views/order_view.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrderView(),
    );
  }
}
