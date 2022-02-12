import 'package:eshop/Constant/app_keys.dart';
import 'package:eshop/Screens/Authentication/Signup/Views/signup_view.dart';
import 'package:eshop/Screens/CommonWidgets/nav_bar.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: Navbar(
        title: AppKeys.signup,
      ),
      body: SignupView(),
    );
  }
}
