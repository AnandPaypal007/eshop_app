import 'package:eshop/Screens/CommonWidgets/app_title.dart';
import 'package:flutter/material.dart';

class CategoryCardView extends StatelessWidget {
  final String? logo;
  final String? title;
  const CategoryCardView({Key? key, this.logo, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          boxShadow: const [
            BoxShadow(
              color: Colors.blue,
              blurRadius: 1,
              offset: Offset(1, 1), // Shadow position
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Column(
            children: [
              Image.network(
                logo ?? "",
                fit: BoxFit.fill,
                width: 120,
                height: 100,
              ),
              SizedBox(
                height: 20,
                child: AppTitle(
                  color: Colors.white,
                  title: title ?? "",
                  padding: const EdgeInsets.only(top: 7),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}