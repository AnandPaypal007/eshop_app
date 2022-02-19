import 'package:eshop/Screens/CommonWidgets/app_title.dart';
import 'package:flutter/material.dart';

class ViewAll extends StatelessWidget {
  final String? title;
  final EdgeInsets? padding;
  const ViewAll({Key? key, this.title, this.padding = EdgeInsets.zero})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          //width: double.infinity,
          child: AppTitle(
            textAlign: TextAlign.left,
            title: title ?? "",
            padding:
                padding ?? const EdgeInsets.only(left: 10, right: 10, top: 15),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const Spacer(),
        const Icon(Icons.arrow_forward_ios)
      ],
    );
  }
}
