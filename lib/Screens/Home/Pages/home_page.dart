import 'package:eshop/Screens/CommonWidgets/nav_bar.dart';
import 'package:eshop/Screens/Home/Views/home_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: Navbar(
        title: "",
        isCart: true,
      ),
      body: HomeView(),
    );
  }
}
