import 'package:eshop/Constant/app_keys.dart';
import 'package:eshop/Screens/Authentication/Signup/Views/signup_view.dart';
import 'package:eshop/Screens/Authentication/bloc/auth_repo.dart';
import 'package:eshop/Screens/Authentication/bloc/index.dart';
import 'package:eshop/Screens/CommonWidgets/app_alert.dart';
import 'package:eshop/Screens/CommonWidgets/app_loader.dart';
import 'package:eshop/Screens/CommonWidgets/nav_bar.dart';
import 'package:eshop/Utils/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  AuthenticationBloc? bloc;

  @override
  void initState() {
    super.initState();
    bloc = AuthenticationBloc(const AuthenticationDefaultState(), AuthRepo());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(
        title: AppKeys.signup,
      ),
      body: BlocProvider(
        create: (context) => bloc!,
        child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            return Stack(
              children: [
                const SignupView(),
                if (state is AuthenticationLoadingState) const AppLoader()
              ],
            );
          },
          listener: (c, state) {
            if (state is AuthenticationDoneState) {
              AppAlert.showToast(message: "User registered successfully");
              AppNavigator.pop();
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    bloc?.close();
    super.dispose();
  }
}
