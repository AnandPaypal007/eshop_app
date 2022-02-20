import 'package:eshop/Screens/Profile/ProfileViews/profile_view.dart';
import 'package:eshop/Utils/apptheme.dart';
import 'package:flutter/material.dart';

class ProfiilePage extends StatelessWidget {
  const ProfiilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue100,
      body: const ProfileView(),
    );
  }
}
