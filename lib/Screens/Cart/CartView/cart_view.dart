import 'package:eshop/Models/cart.dart';
import 'package:eshop/Screens/Cart/CartView/cart_cell.dart';
import 'package:eshop/Screens/Cart/bloc/cart_bloc.dart';
import 'package:eshop/Screens/Cart/bloc/cart_state.dart';
import 'package:eshop/Screens/CommonWidgets/app_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartBloc bloc = BlocProvider.of<CartBloc>(context);

    return BlocConsumer(
      builder: (c, state) {
        if (state is CartLoadingState || state is CartDefaultState) {
          return const AppLoader();
        } else if (state is CartFetchingDoneState) {
          return ListView.builder(
              padding: const EdgeInsets.only(top: 10),
              itemBuilder: (c, index) {
                final MCart cart = bloc.repo.product[index];
                return CartCell(
                  cart: cart,
                );
              },
              itemCount: bloc.repo.count);
        } else {
          return Container();
        }
      },
      listener: (c, state) {},
      bloc: bloc,
    );
  }
}
