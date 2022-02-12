import 'package:eshop/Screens/Cart/CartView/cart_view.dart';
import 'package:eshop/Screens/Cart/bloc/cart_bloc.dart';
import 'package:eshop/Screens/Cart/bloc/cart_event.dart';
import 'package:eshop/Screens/Cart/bloc/cart_repo.dart';
import 'package:eshop/Screens/Cart/bloc/cart_state.dart';
import 'package:eshop/Screens/CommonWidgets/nav_bar.dart';
import 'package:eshop/Utils/apptheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  CartBloc? bloc;

  @override
  void initState() {
    super.initState();
    bloc = CartBloc(CartDefaultState(), CartRepo());
    bloc?.add(LoadCartEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.blue100,
        appBar: const Navbar(
          isCart: false,
          title: "Cart",
        ),
        body: BlocProvider(
          create: (c) => bloc!,
          child: const CartView(),
        ));
  }
}
