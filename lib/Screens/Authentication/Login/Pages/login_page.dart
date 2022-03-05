import 'package:eshop/Constant/app_keys.dart';
import 'package:eshop/Screens/Authentication/Login/Views/login_view.dart';
import 'package:eshop/Screens/Authentication/bloc/auth_repo.dart';
import 'package:eshop/Screens/Authentication/bloc/authentication_bloc.dart';
import 'package:eshop/Screens/Authentication/bloc/authentication_state.dart';
import 'package:eshop/Screens/CommonWidgets/app_web_builder.dart';
import 'package:eshop/Screens/CommonWidgets/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(
        title: AppKeys.login,
      ),
      body: BlocProvider(
        create: (c) =>
            AuthenticationBloc(const AuthenticationDefaultState(), AuthRepo()),
        child: const WebBuilder(child: LoginView()),
      ),
    );
  }
}
