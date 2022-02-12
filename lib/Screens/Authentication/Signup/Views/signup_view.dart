import 'package:eshop/Constant/app_keys.dart';
import 'package:eshop/Screens/CommonWidgets/app_round_button.dart';
import 'package:eshop/Screens/CommonWidgets/app_textfield.dart';
import 'package:flutter/material.dart';

class SignupView extends StatelessWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          AppTextField(
            hintText: AppKeys.firstName,
          ),
          AppTextField(
            hintText: AppKeys.lastName,
            topMargin: 10,
          ),
          AppTextField(
            hintText: AppKeys.email,
            topMargin: 10,
          ),
          AppTextField(
            hintText: AppKeys.password,
            topMargin: 10,
          ),
          AppTextField(
            hintText: AppKeys.confirmPassword,
            topMargin: 10,
          ),
          AppRoundButton(
            title: AppKeys.signup,
            margin: 30,
          )
        ],
      ),
    );
  }
}
