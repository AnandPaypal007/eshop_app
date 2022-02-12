import 'package:eshop/Screens/Home/Pages/home_page.dart';
import 'package:flutter/material.dart';

class AppNavigator {
  static push(context, Widget child) {
    Navigator.push(context, MaterialPageRoute(builder: (c) => child));
  }

  static pushRemovingAll(context, Widget child) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const HomePage()),
        (Route<dynamic> route) => false);
  }
}
