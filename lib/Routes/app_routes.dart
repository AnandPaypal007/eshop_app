import 'package:eshop/Screens/Authentication/authenticator.dart';
import 'package:eshop/Screens/Profile/bloc/index.dart';
import 'package:eshop/Screens/Profile/bloc/user_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Map getRoutes() {
  return {
    AppRoutes.auth: (context) => BlocProvider(
          create: (c) => UserBloc(UserDeaultState(), UserRepo()),
          child: const Authenticator(),
        ),
  };
}

class AppRoutes {
  static String auth = "/";
}
