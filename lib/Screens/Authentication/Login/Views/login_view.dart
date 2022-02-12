import 'package:eshop/Constant/app_keys.dart';
import 'package:eshop/Screens/Authentication/Signup/Pages/signup_page.dart';
import 'package:eshop/Screens/Authentication/bloc/authentication_bloc.dart';
import 'package:eshop/Screens/Authentication/bloc/index.dart';
import 'package:eshop/Screens/CommonWidgets/app_alert.dart';
import 'package:eshop/Screens/CommonWidgets/app_loader.dart';
import 'package:eshop/Screens/CommonWidgets/app_round_button.dart';
import 'package:eshop/Screens/CommonWidgets/app_textfield.dart';
import 'package:eshop/Screens/CommonWidgets/app_title.dart';
import 'package:eshop/Screens/Home/Pages/home_page.dart';
import 'package:eshop/Utils/app_navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      builder: (c, state) {
        print(state);
        return Stack(
          children: [
            const Padding(padding: EdgeInsets.all(20.0), child: _LoginForm()),
            if (state is AuthenticationLoadingState) const AppLoader()
          ],
        );
      },
      listener: (c, state) {
        if (state is AuthenticationDoneState) {
          AppNavigator.pushRemovingAll(context, const HomePage());
        }
        if (state is ErrorAuthenticationState) {
          AppAlert.showAlert(message: state.errorMessage, context: context);
        }
      },
      bloc: BlocProvider.of<AuthenticationBloc>(context),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AuthenticationBloc>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppTextField(
          hintText: AppKeys.email,
          onChange: (v) => bloc.repo.email = v,
        ),
        AppTextField(
          hintText: AppKeys.password,
          topMargin: 15,
          onChange: (v) => bloc.repo.password = v,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (c) => const SignupPage())),
              child: const AppTitle(
                decoration: TextDecoration.underline,
                title: AppKeys.signup,
                padding: EdgeInsets.only(top: 15, right: 5),
              ),
            ),
          ],
        ),
        AppRoundButton(
            title: AppKeys.login,
            margin: 40,
            onPressed: () => _loginPressed(context)),
      ],
    );
  }

  _loginPressed(context) {
    final bloc = BlocProvider.of<AuthenticationBloc>(context);
    final error = bloc.repo.validate();
    if (error != null) {
      AppAlert.showAlert(message: error, context: context);
      return;
    }
    bloc.add(SigninEvent());
  }
}
