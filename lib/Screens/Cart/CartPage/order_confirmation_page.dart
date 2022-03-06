import 'package:eshop/Screens/Cart/CartView/order_confirmation_view.dart';
import 'package:eshop/Screens/Cart/bloc/cart_repo.dart';
import 'package:eshop/Screens/Cart/bloc/index.dart';
import 'package:eshop/Screens/CommonWidgets/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderConfirmationPage extends StatefulWidget {
  final int invoiceId;
  const OrderConfirmationPage({Key? key, this.invoiceId = 0}) : super(key: key);

  @override
  State<OrderConfirmationPage> createState() => _OrderConfirmationPageState();
}

class _OrderConfirmationPageState extends State<OrderConfirmationPage> {
  CartBloc? bloc;
  @override
  void initState() {
    super.initState();
    bloc = CartBloc(CartDefaultState(), CartRepo());
    bloc?.repo.invoice = widget.invoiceId;
    bloc?.add(MakePaymentEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(
        title: "Order Confirmation",
      ),
      body: BlocProvider(
        create: (c) => bloc!,
        child: const OrderConfirmationView(),
      ),
    );
  }
}
