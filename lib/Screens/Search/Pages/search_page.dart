
import 'package:eshop/Screens/CommonWidgets/nav_bar.dart';
import 'package:eshop/Screens/Search/Views/search_view.dart';
import 'package:eshop/Screens/Search/bloc/index.dart';
import 'package:eshop/Screens/Search/bloc/search_bloc.dart';
import 'package:eshop/Screens/Search/bloc/search_repo.dart';
import 'package:eshop/Utils/apptheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.blue100,
        appBar: const Navbar(
          title: "Search Results",
        ),
        body: BlocProvider(
          create: (c) => SearchBloc(SearchDefaultState(), SearchRepo()),
          child: const SearchView(),
        ));
  }
}
