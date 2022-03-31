import 'package:eshop/Constant/app_keys.dart';
import 'package:eshop/Screens/Authentication/bloc/auth_repo.dart';
import 'package:eshop/Screens/Authentication/bloc/authentication_bloc.dart';
import 'package:eshop/Screens/Authentication/bloc/index.dart';
import 'package:eshop/Screens/CommonWidgets/app_alert.dart';
import 'package:eshop/Screens/CommonWidgets/app_round_button.dart';
import 'package:eshop/Screens/CommonWidgets/app_textfield.dart';
import 'package:eshop/Screens/CommonWidgets/app_web_builder.dart';
import 'package:eshop/Utils/app_animator.dart';
import 'package:eshop/Utils/app_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupView extends StatelessWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationBloc bloc = BlocProvider.of<AuthenticationBloc>(context);
    AuthRepo repo = bloc.repo;
    return WebBuilder(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           const SizedBox(child:  AppAnimatorView(repeat: false,type: AppAnnimation.registration), height: 200, width: 300,),
           const SizedBox(height: 20,),
            AppTextField(
              hintText: AppKeys.firstName,
              onChange: (v) {
                repo.msignup.firstNname = v;
              },
              value: repo.msignup.firstNname,
            ),
            AppTextField(
              hintText: AppKeys.lastName,
              topMargin: 10,
              onChange: (v) {
                repo.msignup.lastName = v;
              },
              value: repo.msignup.lastName,
            ),
            AppTextField(
              hintText: AppKeys.email,
              topMargin: 10,
              onChange: (v) {
                repo.msignup.email = v;
              },
              value: repo.msignup.email,
            ),
            AppTextField(
              hintText: AppKeys.password,
              topMargin: 10,
              onChange: (v) {
                repo.msignup.passsword = v;
              },
              obscureText: true,
              value: repo.msignup.passsword,
            ),
            AppTextField(
              hintText: AppKeys.confirmPassword,
              topMargin: 10,
              obscureText: true,
              onChange: (v) {
                repo.msignup.confirmPasssword = v;
              },
              value: repo.msignup.confirmPasssword,
            ),
            AppRoundButton(
              title: AppKeys.signup,
              margin: 30,
              onPressed: () {
                final error = repo.msignup.validate();
                if (error == null) {
                  bloc.add(SignupEvent());
                } else {
                  AppAlert.showAlert(message: error);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
