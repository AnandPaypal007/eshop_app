import 'package:eshop/Utils/apptheme.dart';
import 'package:flutter/material.dart';

import 'app_title.dart';

class AppRoundButton extends StatefulWidget {
  final double width;
  final String? title;
  final double height;
  final double fontSize;
  final FontWeight fontWeight;
  final Function? onPressed;
  final Color backgroundColor;
  final Color titleColor;
  final double margin;
  final bool isBorder;
  final Color borderColor;
  final isRightIcon;
  final bool isLocalised;

  const AppRoundButton(
      {Key? key,
      this.width = 140,
      this.height = 45,
      @required this.title,
      this.fontSize = 16,
      this.fontWeight = FontWeight.normal,
      this.onPressed,
      this.backgroundColor = AppColors.darkBlue,
      this.titleColor = Colors.white,
      this.margin = 0.0,
      this.isBorder = false,
      this.borderColor = Colors.blueAccent,
      this.isRightIcon = true,
      this.isLocalised = true})
      : super(key: key);

  @override
  _AppRoundButtonState createState() => _AppRoundButtonState();
}

class _AppRoundButtonState extends State<AppRoundButton> {
  @override
  Widget build(BuildContext context) {
    bool isError = false;
    return Container(
      height: widget.height,
      width: widget.width,
      margin: EdgeInsets.all(this.widget.margin),
      child: InkWell(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AppTitle(
              title: widget.title,
              fontSize: widget.fontSize,
              fontWeight: widget.fontWeight,
              color: widget.titleColor,
              isLocalised: widget.isLocalised,
            ),
            widget.isRightIcon
                ? const Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 20,
                    ),
                  )
                : Container()
          ],
        ),
        onTap: () => isError ? null : widget.onPressed!(),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: widget.isBorder
            ? Border.all(color: this.widget.borderColor, width: 1)
            : null,
        color: isError
            ? this.widget.backgroundColor.withOpacity(0.3)
            : this.widget.backgroundColor,
      ),
    );
  }
}
