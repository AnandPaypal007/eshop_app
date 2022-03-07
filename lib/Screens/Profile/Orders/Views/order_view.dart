import 'package:eshop/Screens/CommonWidgets/app_loader.dart';
import 'package:eshop/Screens/Profile/Orders/Views/orders_cell.dart';
import 'package:eshop/Screens/Profile/bloc/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderView extends StatelessWidget {
  const OrderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserBloc bloc = BlocProvider.of<UserBloc>(context);
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserLoadingState || state is UserDeaultState) {
          return const AppLoader();
        }
        return ListView.builder(
          itemBuilder: (c, index) {
            return OrdersCell(
              order: bloc.repo.orderFor(index),
            );
          },
          itemCount: bloc.repo.ordersCount,
        );
      },
      bloc: BlocProvider.of<UserBloc>(context),
    );
  }
}
