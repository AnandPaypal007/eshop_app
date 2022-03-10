import 'package:eshop/Routes/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: NavigationService.navigatorKey,
        title: 'Eshop',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {...getRoutes()},
        // home: BlocProvider(
        //   create: (c) => UserBloc(UserDeaultState(), UserRepo()),
        //   child: const Authenticator(),
        // )
        );
  }
}


class NavigationService { 
  static GlobalKey<NavigatorState> navigatorKey = 
  GlobalKey<NavigatorState>();
}
