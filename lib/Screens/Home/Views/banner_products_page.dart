import 'package:eshop/Screens/CommonWidgets/app_loader.dart';
import 'package:eshop/Screens/CommonWidgets/nav_bar.dart';
import 'package:eshop/Screens/Home/bloc/home_repo.dart';
import 'package:eshop/Screens/Home/bloc/index.dart';
import 'package:eshop/Screens/Products/Pages/grid_options.dart';
import 'package:eshop/Utils/apptheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BannerProductsPage extends StatefulWidget {
  final int? id;
  const BannerProductsPage({Key? key, @required this.id}) : super(key: key);

  @override
  State<BannerProductsPage> createState() => _BannerProductsPageState();
}

class _BannerProductsPageState extends State<BannerProductsPage> {
  HomeBloc? bloc;
  @override
  void initState() {
    super.initState();
    bloc = HomeBloc(HomeDefaultState(), HomeRepo());
    bloc?.add(LoadOffersDetailsEvent(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue100,
      appBar: const Navbar(
        title: "Products",
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is OffersDoneState) {
            final products = bloc?.repo.products;
            return Column(
              children: [
                ProductGrid(
                  products: products,
                ),
              ],
            );
          } else if (state is HomeLoadingState || state is HomeDefaultState) {
            return const AppLoader();
          } else {
            return Container();
          }
        },
        bloc: bloc,
      ),
    );
  }
}
