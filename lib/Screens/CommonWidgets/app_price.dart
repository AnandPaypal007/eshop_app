import 'package:eshop/Screens/CommonWidgets/app_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class AppPrice extends StatelessWidget {
  final num price;
  final EdgeInsets padding;
  final String titel;
  final bool isLineThrough;
  const AppPrice(
      {Key? key,
      this.price = 0.0,
      this.padding = EdgeInsets.zero,
      this.titel = "Price Rs: ",
      this.isLineThrough = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: [
          AppTitle(
            decoration: isLineThrough
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            title: titel,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          AppTitle(
            title: "$price",
            decoration: isLineThrough
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          )
        ],
      ),
    );
  }
}
