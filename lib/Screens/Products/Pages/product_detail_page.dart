import 'package:eshop/Screens/CommonWidgets/app_loader.dart';
import 'package:eshop/Screens/Products/Views/product_details.dart';
import 'package:eshop/Screens/Products/bloc/index.dart';
import 'package:eshop/Screens/Products/bloc/product_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsPage extends StatefulWidget {
  final int id;
  const ProductDetailsPage({Key? key, this.id = 0}) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailsPage> {
  ProductBloc bloc = ProductBloc(ProductDefaultState(), ProductRepo(0));

  @override
  void initState() {
    super.initState();
    bloc.add(ProductDetailEvent(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (c) => bloc,
        child: BlocBuilder(
          builder: (c, state) {
            if (state is ProductDefaultState || state is ProductLoadingState) {
              return const AppLoader();
            } else if (state is ProductDoneState) {
              return ProductDetailsView(
                product: bloc.repo.productDetail,
              );
            } else {
              return Container();
            }
          },
          bloc: bloc,
        ),
      ),
    );
  }
}
