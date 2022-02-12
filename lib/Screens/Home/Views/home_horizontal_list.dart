import 'package:flutter/material.dart';

class HomeHorizontalList extends StatelessWidget {
  const HomeHorizontalList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: const EdgeInsets.all(5),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (c, index) {
          return Container(
            margin: const EdgeInsets.all(5),
            height: 100,
            width: 100,
            color: Colors.red,
          );
        },
        itemCount: 5,
      ),
    );
  }
}
