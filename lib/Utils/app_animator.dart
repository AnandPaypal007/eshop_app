import 'package:eshop/Utils/app_enum.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppAnimatorView extends StatelessWidget {
  final AppAnnimation? type;
  final bool? repeat;
  const AppAnimatorView({Key? key, @required this.type, this.repeat = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(type!.path(),repeat: repeat);
  }
}
