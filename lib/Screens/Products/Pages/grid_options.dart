import 'package:eshop/Models/product.dart';
import 'package:eshop/Screens/CommonWidgets/app_loader.dart';
import 'package:eshop/Screens/Home/Views/product_grid_card_view.dart';
import 'package:eshop/Screens/Home/Views/product_list_card_view.dart';
import 'package:eshop/Screens/Products/Pages/product_detail_page.dart';
import 'package:eshop/Screens/Products/Views/product_details.dart';
import 'package:eshop/Screens/Products/bloc/product_bloc.dart';
import 'package:eshop/Screens/Products/bloc/product_state.dart';
import 'package:eshop/Utils/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class GridOptions extends StatefulWidget {
  const GridOptions({Key? key}) : super(key: key);

  @override
  State<GridOptions> createState() => _GridOptionsState();
}

class _GridOptionsState extends State<GridOptions> {
  bool isList = false;
  Widget? child;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      listener: (c, state) {},
      builder: (context, state) {
        if (state is ProductDoneState) {
          final products = BlocProvider.of<ProductBloc>(context).repo.products;
          child = ProductGrid(
            products: products,
          );
        }
        return Column(
          children: [
            /* SizedBox(
              height: 40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.list,
                        color: isList ? Colors.black : AppColors.grey500,
                      ),
                      onPressed: () {
                        setState(() {
                          isList = true;
                          child = const ProductList();
                        });
                      }),
                  IconButton(
                      icon: Icon(
                        Icons.grid_view,
                        color: !isList ? Colors.black : AppColors.grey500,
                      ),
                      onPressed: () {
                        setState(() {
                          isList = false;
                          child = const ProductGrid();
                        });
                      })
                ],
              ),
            )*/
            if (state is ProductLoadingState)
              const Center(child: AppLoader())
            else if (state is ProductDoneState)
              child ?? Container()
            else
              Container()
          ],
        );
      },
      bloc: BlocProvider.of<ProductBloc>(context),
    );
  }
}

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final repo = BlocProvider.of<ProductBloc>(context).repo;
    return Expanded(
        child: ListView.builder(
      itemBuilder: (context, index) {
        final MProducts product = repo.product(index);
        return ProductListCardView(
          product: product,
        );
      },
      itemCount: repo.productsCount,
    ));
  }
}

class ProductGrid extends StatelessWidget {
  final List<MProducts>? products;
  const ProductGrid({Key? key, this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final repo = BlocProvider.of<ProductBloc>(context).repo;
    return Expanded(
      child: GridView.builder(
        itemBuilder: (context, position) {
          //final MProducts product = repo.product(position);
          final MProducts product = products![position];
          return GestureDetector(
            onTap: () {
              AppNavigator.push(
                  ProductDetailsPage(
                    id: product.id ?? 0,
                  ));
            },
            child: ProductCardView(
              product: product,
            ),
          );
        },
        itemCount: products?.length ?? 0,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 272.0, crossAxisCount: kIsWeb ? 8 : 2),
      ),
    );
  }
}
