import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  final String? title;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final EdgeInsets padding;
  final int? maxLines;
  final double? fontSize;
  final bool isLocalised;
  final Color color;
  final TextDecoration decoration;
  final double lineHeight;
  final String fontFamily;
  const AppTitle(
      {Key? key,
      @required this.title,
      this.fontWeight = FontWeight.normal,
      this.textAlign = TextAlign.center,
      this.padding = EdgeInsets.zero,
      this.maxLines,
      this.fontSize,
      this.isLocalised = false,
      this.color = Colors.black,
      this.decoration = TextDecoration.none,
      this.lineHeight = 1,
      this.fontFamily = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        isLocalised ? title! : title ?? '',
        maxLines: maxLines,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
        textAlign: textAlign,
        style: TextStyle(
            decoration: decoration,
            fontWeight: fontWeight,
            fontFamily: fontFamily,
            fontSize: fontSize,
            height: lineHeight,
            color: color),
      ),
    );
  }
}
