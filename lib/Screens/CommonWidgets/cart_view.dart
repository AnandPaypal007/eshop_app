import 'package:eshop/Screens/CommonWidgets/app_loader.dart';
import 'package:eshop/Screens/Profile/bloc/user_bloc.dart';
import 'package:eshop/Screens/Profile/bloc/user_event.dart';
import 'package:eshop/Screens/Profile/bloc/user_repo.dart';
import 'package:eshop/Screens/Profile/bloc/user_state.dart';
import 'package:eshop/Utils/user_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCartView extends StatefulWidget {
  final int quantity;
  final int productId;
  const AppCartView({Key? key, this.productId = 0, this.quantity = 0})
      : super(key: key);

  @override
  State<AppCartView> createState() => _AppCartViewState();
}

class _AppCartViewState extends State<AppCartView> {
  UserBloc? bloc;

  @override
  void initState() {
    super.initState();
    bloc = UserBloc(UserDeaultState(), UserRepo());
    bloc?.add(LoadCartCountEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          if (state is UserLoadingState) return const AppLoader();
          if (state is CartFetchingDoneState) {
            UserSession.shared.refreshCart();
          }
          return IconButton(
              onPressed: () {
                bloc?.add(AddCartEvent(body: {
                  "product_id": widget.productId,
                  "quantity": widget.quantity
                }));
              },
              icon: const Icon(Icons.shopping_cart));
        });
  }
}
