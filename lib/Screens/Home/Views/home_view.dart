import 'package:eshop/Screens/Home/Views/home_banner_view.dart';
import 'package:eshop/Screens/Home/Views/home_horizontal_list.dart';
import 'package:flutter/material.dart';

import 'categories_grid_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: const [
            HomeBannerView(),
            CategoriesGridView(),
            HomeHorizontalList(),
            HomeHorizontalList(),
          ],
        ),
      ),
    );
  }
}
