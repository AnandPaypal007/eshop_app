import 'package:eshop/Screens/CommonWidgets/app_title.dart';
import 'package:eshop/Screens/Profile/Orders/Pages/order_page.dart';
import 'package:eshop/Utils/app_navigator.dart';
import 'package:eshop/Utils/apptheme.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);
  static const options = ["Orders", "Logout"];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              CircleAvatar(
                radius: 50.0,
                child: Text('C'),
              ),
              AppTitle(
                title: "Vikram Singh Rajpoot",
                padding: EdgeInsets.only(top: 10),
              ),
              AppTitle(
                title: "vikram@gmail.com",
                padding: EdgeInsets.only(top: 10),
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(color: Colors.white),
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
                        color: Colors.white,
                        child: Row(
                          children: [
                            AppTitle(title: options[index]),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios_outlined)
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
              onPressed: () {},
            ))
      ],
    );
  }
}
