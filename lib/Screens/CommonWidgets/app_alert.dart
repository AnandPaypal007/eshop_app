import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'app_title.dart';

class AppAlert {
  static showAlert(
      {String title = '',
      String message = '',
      BuildContext? context,
      isLocalised = false}) {
    showDialog(
        context: context!,
        builder: (BuildContext context) {
          return AlertDialog(
            title:  AppTitle(
              title: title,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              isLocalised: isLocalised,
            ),
            content: AppTitle(
              title: message,
              fontSize: 18,
              isLocalised: isLocalised,
              maxLines: 5,
            ),
            actions: <Widget>[
              FlatButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        });
  }

  static showToast({String message = "",ToastGravity? gravity = ToastGravity.CENTER}){
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: gravity,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );

  }
}