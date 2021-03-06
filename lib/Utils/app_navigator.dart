import 'package:eshop/Screens/Home/Pages/home_page.dart';
import 'package:eshop/Screens/Products/Pages/product_detail_page.dart';
import 'package:eshop/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppNavigator {
  static push(Widget child) {
    kIsWeb
        ? Navigator.push(
            NavigationService.navigatorKey.currentContext!,
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => child,
              transitionDuration: const Duration(seconds: 0),
            ),
          )
        : Navigator.push(NavigationService.navigatorKey.currentContext!,
            MaterialPageRoute(builder: (c) => child));
  }

  static pushRemovingAll(Widget child) {
    Navigator.of(NavigationService.navigatorKey.currentContext!)
        .pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const HomePage()),
            (Route<dynamic> route) => false);
  }

  static productDetail({
    id,
  }) {
    push(ProductDetailsPage(
      id: id,
    ));
  }

  static pop() {
    Navigator.pop(NavigationService.navigatorKey.currentContext!);
  }

  static popToRoot() {
    Navigator.popUntil(NavigationService.navigatorKey.currentContext!,
        (Route<dynamic> route) => route.isFirst);
  }
}
