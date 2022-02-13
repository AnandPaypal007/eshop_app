import 'package:eshop/Screens/CommonWidgets/nav_bar.dart';
import 'package:eshop/Screens/Facourite/Views/favourite_view.dart';
import 'package:eshop/Screens/Facourite/bloc/favourite_bloc.dart';
import 'package:eshop/Screens/Facourite/bloc/favourite_event.dart';
import 'package:eshop/Screens/Facourite/bloc/favourite_repo.dart';
import 'package:eshop/Screens/Facourite/bloc/favourite_state.dart';
import 'package:eshop/Utils/apptheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  FavouriteBloc? bloc;

  @override
  void initState() {
    bloc = FavouriteBloc(FavouriteDefaultState(), FavouriteRepo());
    bloc?.add(LoadFavouriteEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.blue100,
        appBar: const Navbar(
          title: "Favourite",
          isSearch: true,
          isCart: true,
        ),
        body: BlocProvider(
          create: (c) => bloc!,
          child: const FavouriteView(),
        ));
  }

  @override
  void dispose() {
    bloc?.close();
    super.dispose();
  }
}
