import 'package:eshop/Screens/Facourite/Pages/favourite_page.dart';
import 'package:eshop/Screens/Home/Pages/home_page.dart';
import 'package:eshop/Screens/Home/Views/home_view.dart';
import 'package:eshop/Screens/Profile/ProfilePages/profile_page.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';

class AppTabbar extends StatefulWidget {
  const AppTabbar({
    Key? key,
  }) : super(key: key);

  @override
  State<AppTabbar> createState() => _AppTabbarState();
}

class _AppTabbarState extends State<AppTabbar> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getPages(),
      bottomNavigationBar: FancyBottomNavigation(
        tabs: [
          TabData(iconData: Icons.home, title: "Home"),
          TabData(iconData: Icons.favorite, title: "Favourite"),
          TabData(iconData: Icons.settings, title: "Profile")
        ],
        onTabChangedListener: (position) {
          setState(() {
            index = position;
          });
        },
      ),
    );
  }

  _getPages() {
    switch (index) {
      case 0:
        return const HomePage();

      case 1:
        return const FavouritePage();

      default:
        return const ProfiilePage();
    }
  }
}
