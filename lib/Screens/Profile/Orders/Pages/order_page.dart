import 'package:eshop/Screens/CommonWidgets/nav_bar.dart';
import 'package:eshop/Screens/Profile/Orders/Views/order_view.dart';
import 'package:eshop/Screens/Profile/bloc/index.dart';
import 'package:eshop/Screens/Profile/bloc/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  UserBloc? bloc;

  @override
  void initState() {
    bloc = UserBloc(UserDeaultState(), UserRepo());
    bloc?.add(LoadOrdersEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(
        title: "Orders",
      ),
      body: BlocProvider(
        create: (context) => bloc!,
        child: const OrderView(),
      ),
    );
  }
}
