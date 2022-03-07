import 'package:eshop/Models/orders.dart';
import 'package:eshop/Screens/CommonWidgets/app_price.dart';
import 'package:eshop/Screens/CommonWidgets/app_title.dart';
import 'package:eshop/Utils/app_extension.dart';
import 'package:flutter/material.dart';

class OrdersCell extends StatelessWidget {
  final MOrders? order;
  const OrdersCell({Key? key, this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 10.0, top: 15, bottom: 15, right: 10),
        child: Column(
          children: [
            Row(
              children: [
                AppTitle(title: "Order Id: ${order!.id}"),
                const Spacer(),
                AppTitle(
                    title:
                        "Ordered on: ${order!.invoice?.createdAt!.toDate()}"),
                const Spacer(),
                AppTitle(title: order?.status)
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                AppPrice(
                  price: order?.invoice?.total ?? 0.0,
                  titel: "Total Rs:",
                ),
                const Spacer(),
                AppPrice(
                  price: order?.invoice?.tax ?? 0.0,
                  titel: "Tax Rs:",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
