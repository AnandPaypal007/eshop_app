import 'package:eshop/Screens/AppTabbar/app_tabbar.dart';
import 'package:eshop/Screens/Authentication/Login/Pages/login_page.dart';
import 'package:eshop/Screens/CommonWidgets/app_loader.dart';
import 'package:eshop/Screens/Home/Pages/home_page.dart';
import 'package:eshop/Utils/user_session.dart';
import 'package:flutter/material.dart';

class Authenticator extends StatefulWidget {
  const Authenticator({Key? key}) : super(key: key);

  @override
  State<Authenticator> createState() => _AuthenticatorState();
}

class _AuthenticatorState extends State<Authenticator> {
  Future<dynamic>? future;

  @override
  void initState() {
    super.initState();
    future = UserSession.shared.getToekn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          builder: (c, AsyncSnapshot<dynamic> snap) {
            if (snap.hasData && snap.data != null && snap.data.length > 0) {
              return const AppTabbar();
            } else if (snap.hasError && snap.error != null) {
              return const LoginPage();
            } else {
              return const LoginPage();
            }
          },
          future: future),
    );
  }
}
