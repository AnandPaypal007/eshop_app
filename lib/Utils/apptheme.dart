import 'package:flutter/material.dart';

class AppColors {
  static const darkBlue = Color(0xff0077ff);
  static const lightBlue = Color.fromRGBO(244, 248, 249, 1);
  static const lightLightBlue = Color.fromRGBO(134, 200, 252, 1);
  static const gmailBlue = Color.fromRGBO(83, 132, 237, 1);
  static const fbBlue = Color.fromRGBO(82, 109, 164, 1);
  static const brightSkyblue = Color(0xff0cc9ff);
  static const red = Color(0xffdd5044);
  static const green = Color(0xff18a05e);
  static const blackLight = Color(0xff28363f);
  static final greyBorder = Colors.grey[300];
  static final lightGrey = Colors.grey[500];
  static final grey700 = Colors.grey[700];
  static final grey600 = Colors.grey[600];
  static final grey500 = Colors.grey[500];
  static final grey200 = Colors.grey[200];
  static final grey100 = Colors.grey[100];
  static final blue100 = Colors.blue[50];
}

class AppFont {
  static const proximaNova = "ProximaNova";
  static const opensBold = "OpenSans-Bold";
  static const openLight = "OpenSans-Light";
  static const openRegular = "OpenSans-Regular";
  static double title0 = 7.5;
  static double title1 = 10.0;
  static double title2 = 12.0;
  static double title3 = 14.0;
  static double title4 = 16.0;
  static double title5 = 18.0;
  static double header = 22.0;

  static FontWeight extraBold = FontWeight.w800;
  static FontWeight bold = FontWeight.w700;
  static FontWeight semiBold = FontWeight.w600;
  static FontWeight medium = FontWeight.w400;
  static FontWeight regular = FontWeight.w300;
  static FontWeight thin = FontWeight.w200;
}

class AppTheme {
  static BoxShadow shadow = BoxShadow(
    color: Colors.grey.withOpacity(0.3),
    spreadRadius: 0.1,
    blurRadius: 7,
    offset: Offset(0, 3),
  );
}
