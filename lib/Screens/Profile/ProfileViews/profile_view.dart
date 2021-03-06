import 'package:eshop/Screens/CommonWidgets/app_title.dart';
import 'package:eshop/Screens/CommonWidgets/app_web_builder.dart';
import 'package:eshop/Screens/Profile/Orders/Pages/order_page.dart';
import 'package:eshop/Screens/Profile/bloc/index.dart';
import 'package:eshop/Screens/Profile/bloc/user_repo.dart';
import 'package:eshop/Utils/app_navigator.dart';
import 'package:eshop/Utils/apptheme.dart';
import 'package:eshop/Utils/user_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);
  static const options = ["Orders", "Logout"];

  @override
  Widget build(BuildContext context) {
    UserRepo repo = BlocProvider.of<UserBloc>(context).repo;
    return WebBuilder(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50.0,
                  child: ClipRRect(
                    child: Image.network(repo.profile.profilePic ?? ""),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                AppTitle(
                  title: repo.profile.firstName,
                  padding: const EdgeInsets.only(top: 10),
                ),
                AppTitle(
                  title: repo.profile.email,
                  padding: const EdgeInsets.only(top: 10),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: AppColors.blue100),
              child: ListView.builder(
                itemBuilder: (c, index) {
                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          AppNavigator.push(OrderPage());
                        },
                        child: Container(
                          height: 30,
                          color: Colors.white,
                          child: Row(
                            children: [
                              AppTitle(title: options[index]),
                              const Spacer(),
                              const Icon(Icons.arrow_forward_ios_outlined)
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: options.length,
              ),
            ),
            flex: 3,
          ),
          Expanded(
              flex: 1,
              child: IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () {
                  UserSession.shared.retToekn();
                  Navigator.popAndPushNamed(context, "/");
                },
              ))
        ],
      ),
    );
  }
}
