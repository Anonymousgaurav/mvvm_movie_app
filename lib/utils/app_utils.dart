import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppUtils {
  // static void flushBar(BuildContext context, String message) {
  //   showFlushbar(
  //       context: context,
  //       flushbar: Flushbar(
  //         message: message,
  //         reverseAnimationCurve: Curves.easeInOut,
  //         positionOffset: 20,
  //         duration: const Duration(seconds: 3),
  //       )..show(context));
  // }

  static snackBar(BuildContext context, String message) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
