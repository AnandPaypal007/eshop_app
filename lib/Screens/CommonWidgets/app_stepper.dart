import 'package:eshop/Utils/apptheme.dart';
import 'package:flutter/material.dart';

import 'app_title.dart';

class AppStepper extends StatefulWidget {
  final Function? valueCallBack;
  final int value;
  final int maxValue;
  final int maxOrderQuantity;
  const AppStepper(
      {Key? key,
      this.valueCallBack,
      this.value = 0,
      this.maxValue = 10,
      this.maxOrderQuantity = 0})
      : super(key: key);

  @override
  _AppStepperState createState() => _AppStepperState();
}

class _AppStepperState extends State<AppStepper> {
  int count = 0;

  @override
  void initState() {
    count = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          GestureDetector(
            child: Container(
              child: Icon(Icons.remove, color: Colors.grey[500]),
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.grey500!),
                  borderRadius: BorderRadius.circular(3)),
            ),
            onTap: () {
              setState(() {
                if (count == 1) return;
                count -= 1;
                widget.valueCallBack!(count);
              });
            },
          ),
          Container(
            margin: const EdgeInsets.only(left: 15, right: 15),
            child: AppTitle(title: "$count"),
            width: 40,
            height: 27,
            color: Colors.grey[200],
            alignment: Alignment.center,
          ),
          GestureDetector(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.grey500!),
                  borderRadius: BorderRadius.circular(3)),
              child: Icon(
                Icons.add,
                color: Colors.grey[500],
              ),
              height: 25,
              width: 25,
            ),
            onTap: () {
              if (widget.maxValue == count ||
                  widget.maxOrderQuantity == count) {
                return;
              }
              setState(() {
                count += 1;
                widget.valueCallBack!(count);
              });
            },
          ),
        ],
      ),
    );
  }
}
