import 'package:eshop/Screens/Cart/CartPage/cart_page.dart';
import 'package:eshop/Screens/Profile/bloc/index.dart';
import 'package:eshop/Screens/Profile/bloc/user_state.dart';
import 'package:eshop/Utils/app_navigator.dart';
import 'package:eshop/Utils/apptheme.dart';
import 'package:eshop/Utils/user_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_loader.dart';
import 'app_title.dart';

class NavCartView extends StatefulWidget {
  final Color? lightGrey;
  const NavCartView({Key? key, this.lightGrey}) : super(key: key);

  @override
  _NavCartViewState createState() => _NavCartViewState();
}

class _NavCartViewState extends State<NavCartView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final repo = UserSession.shared.bloc.repo;
    return BlocBuilder(
      builder: (context, state) {
        if (state is CartFetchingDoneState) {}
        if (state is UserLoadingState) {
          return const AppLoader();
        }
        return Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                child: Icon(Icons.shopping_cart,
                    color: widget.lightGrey ?? AppColors.lightGrey),
                onTap: () {
                  //if (cartCount == 0) return;
                  AppNavigator.push(const CartPage());
                },
              ),
            ),
            Positioned(
              top: 5,
              right: 5,
              child: Container(
                alignment: Alignment.center,
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    color: AppColors.darkBlue,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.darkBlue)),
                child: AppTitle(
                  title: "${repo.cartCount}", //"$cartCount",
                  color: Colors.white,
                  fontSize: AppFont.title1,
                ),
              ),
            ),
          ],
        );
      },
      bloc: UserSession.shared.bloc..add(LoadCartCountEvent()),
    );
  }
}
