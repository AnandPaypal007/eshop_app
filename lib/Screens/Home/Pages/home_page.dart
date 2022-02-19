import 'package:eshop/Screens/CommonWidgets/nav_bar.dart';
import 'package:eshop/Screens/Home/Views/home_view.dart';
import 'package:eshop/Utils/apptheme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue100,
      appBar: const Navbar(
        title: "",
        isCart: true,
        isSearch: true,
      ),
      body: const HomeView(),
    );
  }
}
