import 'package:eshop/Screens/Authentication/Authenticator.dart';
import 'package:eshop/Screens/Home/Pages/home_page.dart';
import 'package:eshop/Screens/Home/bloc/index.dart';
import 'package:eshop/Screens/Profile/bloc/user_bloc.dart';
import 'package:eshop/Screens/Profile/bloc/user_repo.dart';
import 'package:eshop/Screens/Profile/bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Eshop',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider(
          create: (c) => UserBloc(UserDeaultState(), UserRepo()),
          child: const Authenticator(),
        ));
  }
}
