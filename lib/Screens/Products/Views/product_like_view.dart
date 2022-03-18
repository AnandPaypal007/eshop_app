import 'package:eshop/Models/product.dart';
import 'package:eshop/Screens/CommonWidgets/app_loader.dart';
import 'package:eshop/Screens/Facourite/bloc/favourite_repo.dart';
import 'package:eshop/Screens/Facourite/bloc/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductLikeView extends StatefulWidget {
  final MProducts? product;
  const ProductLikeView({Key? key, this.product})
      : super(key: key);

  @override
  State<ProductLikeView> createState() => _ProductLikeViewState();
}

class _ProductLikeViewState extends State<ProductLikeView> {
  FavouriteBloc? bloc;

  @override
  void initState() {
    super.initState();
    bloc = FavouriteBloc(FavouriteDefaultState(), FavouriteRepo());
    bloc?.repo.productId = widget.product!.id!;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc!,
      child: BlocBuilder<FavouriteBloc, FavouriteState>(
        builder: (context, state) {
          if (state is FavouriteLooadingState) return const AppLoader();
          return IconButton(
            onPressed: () {
              bloc?.add(MakeFavouriteEvent());
            },
            icon: const Icon(
              Icons.favorite,
            ),
            color: widget.product!.isLiked! ? Colors.red : Colors.red[200],
          );
        },
      ),
    );
  }
}
