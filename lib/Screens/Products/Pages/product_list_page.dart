import 'package:eshop/Screens/CommonWidgets/nav_bar.dart';
import 'package:eshop/Screens/Home/bloc/home_repo.dart';
import 'package:eshop/Screens/Home/bloc/index.dart';
import 'package:eshop/Screens/Products/Pages/grid_options.dart';
import 'package:eshop/Screens/Products/bloc/product_bloc.dart';
import 'package:eshop/Screens/Products/bloc/product_event.dart';
import 'package:eshop/Screens/Products/bloc/product_repo.dart';
import 'package:eshop/Screens/Products/bloc/product_state.dart';
import 'package:eshop/Utils/apptheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListPage extends StatefulWidget {
  final int? categoryId;
  const ProductListPage({Key? key, this.categoryId}) : super(key: key);

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  bool isList = false;
  ProductBloc? bloc;

  @override
  void initState() {
    super.initState();
    bloc =
        ProductBloc(ProductDefaultState(), ProductRepo(widget.categoryId ?? 0));
    bloc?.add(LoadProductsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue100,
      appBar: const Navbar(
        title: "Products",
      ),
      body: BlocProvider(
        create: (c) => bloc!,
        child: const GridOptions(),
      ),
    );
  }
}
