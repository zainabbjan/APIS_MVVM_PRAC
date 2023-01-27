import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/material.dart';

class Utils {
  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 50,
    );
  }

  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        flushbarPosition: FlushbarPosition.TOP,
        message: message,
        backgroundColor: Colors.yellow,
        title: 'Sad',
        messageColor: Colors.black,
        duration: Duration(seconds: 3),
        reverseAnimationCurve: Curves.slowMiddle,
        positionOffset: 50,
        icon: Icon(Icons.error),
      )..show(context),
    );
  }

  static SnackBar(String message, BuildContext context) {}
}
