import 'package:flutter/material.dart';

class Utils {

  static void snackBarError(String text, context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height-150),
        content: Text(text),
        backgroundColor: Colors.red,
      ));
  }

  static void snackBarSucces(String text, context) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height-150),
          content: Text(text), backgroundColor: Colors.green,));
  }
}