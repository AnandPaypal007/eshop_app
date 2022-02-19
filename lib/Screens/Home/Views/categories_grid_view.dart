import 'package:eshop/Screens/CommonWidgets/app_loader.dart';
import 'package:eshop/Screens/CommonWidgets/app_title.dart';
import 'package:eshop/Screens/Home/Views/category_card_view.dart';
import 'package:eshop/Screens/Home/Views/product_grid_card_view.dart';
import 'package:eshop/Screens/Home/Views/view_all.dart';
import 'package:eshop/Screens/Home/bloc/home_repo.dart';
import 'package:eshop/Screens/Home/bloc/index.dart';
import 'package:eshop/Screens/Products/Pages/product_list_page.dart';
import 'package:eshop/Utils/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesGridView extends StatefulWidget {
  const CategoriesGridView({Key? key}) : super(key: key);

  @override
  State<CategoriesGridView> createState() => _CategoriesGridViewState();
}

class _CategoriesGridViewState extends State<CategoriesGridView> {
  HomeBloc? bloc;
  @override
  void initState() {
    super.initState();
    bloc = HomeBloc(HomeDefaultState(), HomeRepo());
    bloc?.add(LoadAllCategoriesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      builder: (c, state) {
        if (state is CategoryDoneState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ViewAll(
                title: "All Categories",
                padding: EdgeInsets.only(left: 10, right: 10, top: 0),
              ),
              SizedBox(
                height: 140,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (c, index) {
                    final cat = bloc?.repo.categories[index];
                    return GestureDetector(
                      onTap: () => AppNavigator.push(
                          ProductListPage(
                            categoryId: cat?.id,
                          )),
                      child: CategoryCardView(
                        logo: cat?.logo,
                        title: cat?.name,
                      ),
                    );
                  },
                  itemCount: bloc?.repo.categories.length,
                ),
              ),
            ],
          );
        } else if (state is ErrorHomeState) {
          return Container();
        } else {
          return const AppLoader();
        }
      },
      bloc: bloc,
    );
  }
}
