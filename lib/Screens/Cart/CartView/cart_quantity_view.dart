import 'package:eshop/Models/cart.dart';
import 'package:eshop/Screens/Cart/bloc/cart_repo.dart';
import 'package:eshop/Screens/Cart/bloc/index.dart';
import 'package:eshop/Screens/CommonWidgets/app_alert.dart';
import 'package:eshop/Screens/CommonWidgets/app_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartQuantityView extends StatefulWidget {
  final MCart? cart;
  const CartQuantityView({Key? key, this.cart}) : super(key: key);

  @override
  State<CartQuantityView> createState() => _CartQuantityViewState();
}

class _CartQuantityViewState extends State<CartQuantityView> {
  CartBloc? bloc;

  @override
  void initState() {
    super.initState();
    bloc = CartBloc(CartDefaultState(), CartRepo());
  }

  @override
  Widget build(BuildContext context) {
    final repo = BlocProvider.of<CartBloc>(context).repo;
    return BlocConsumer(
      bloc: bloc,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0, right: 20),
              child: AppStepper(
                value: widget.cart!.quantity!,
                valueCallBack: (v) {
                  if (widget.cart != null) {
                    widget.cart!.quantity = v;
                    bloc?.repo.currentItem = widget.cart!;
                  }
                  bloc?.add(UpdateCartQuantityEvent());
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: InkWell(
                  onTap: () {
                    if (widget.cart != null) {
                      bloc?.repo.currentItem = widget.cart!;
                    }
                    repo.removeItemFromLocal(widget.cart!.id);
                    bloc?.add(DeleteCartItemEvent());
                  },
                  child: const Icon(
                    Icons.delete_forever,
                    color: Colors.red,
                  )),
            )
          ],
        );
      },
      listener: (c, state) {
        if (state is CartQuantityUpdatedState) {
          AppAlert.showToast(message: "Quantity updated successfully");
        }
        if (state is CartItemDeletedState) {
          BlocProvider.of<CartBloc>(context).add(ReloadCartEvent());
          AppAlert.showToast(message: "Item deleted successfully");
        }
        if (state is ErrorCartState) {
          AppAlert.showToast(message: state.errorMessage);
        }
      },
    );
  }
}
