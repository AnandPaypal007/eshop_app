import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_title.dart';

class AppTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final double height;
  final double width;
  final Function? onChange;
  final TextInputType keyBoardType;
  final String? labelText;
  final double? topMargin;
  final isRightIcon;
  final Widget? rightIcon;
  final bool isLocalise;
  final bool obscureText;
  final String? value;
  final bool enabled;
  final bool autofocus;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final String suffixText;
  final bool readOnly;
  const AppTextField(
      {Key? key,
      this.hintText = '',
      this.topMargin = 0.0,
      this.controller,
      this.height = 45,
      this.width = double.infinity,
      this.onChange,
      this.keyBoardType = TextInputType.text,
      this.labelText,
      this.isRightIcon = false,
      this.rightIcon,
      this.isLocalise = true,
      this.obscureText = false,
      this.value,
      this.enabled = true,
      this.autofocus = false,
      this.maxLength,
      this.inputFormatters,
      this.suffixText = "",
      this.readOnly = false})
      : super(key: key);

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  void initState() {
    super.initState();
  }

  String? isError;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: widget.height,
          margin: EdgeInsets.only(top: widget.topMargin ?? 15),
          child: Material(
            elevation: 0.5,
            borderRadius: BorderRadius.circular(5.0),
            shadowColor: Colors.white,
            child: TextFormField(
              inputFormatters: widget.keyBoardType == TextInputType.number
                  ? [WhitelistingTextInputFormatter(RegExp(r'^\d+\.?\d{0,2}'))]
                  : [],
              maxLength: widget.maxLength,
              autofocus: this.widget.autofocus,
              enabled: this.widget.enabled,
              readOnly: widget.readOnly,
              initialValue: this.widget.value,
              obscureText: widget.obscureText,
              onChanged: (v) => widget.onChange!(v),
              controller: widget.controller,
              keyboardType: widget.keyBoardType,
              decoration: InputDecoration(
                suffixText: widget.suffixText,
                counterText: "",
                fillColor: Colors.white,
                filled: true,
                suffixIcon: this.widget.rightIcon,
                contentPadding: // Text Field height
                    EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                hintStyle: TextStyle(
                    height: 1, //Controls the height of the hint text
                    color: Colors.grey[400]),
                hintText: widget.isLocalise ? widget.hintText : widget.hintText,
                helperStyle: TextStyle(color: Colors.grey[300]),
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: Colors.grey[300]!)),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(width: 0.5, color: Colors.blue),
                ),
              ),
            ),
          ),
        ),
        if (isError != null && isError!.isNotEmpty)
          AppTitle(
            padding: const EdgeInsets.only(top: 3),
            title: isError,
            color: Colors.red,
            textAlign: TextAlign.left,
            maxLines: 100,
          )
      ],
    );
  }
}
