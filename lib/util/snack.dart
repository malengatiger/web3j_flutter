import 'package:flutter/material.dart';

///Utility class to provide snackBars
class AppSnackBar {
  static showSnackBar(
      {required BuildContext context,
      required String message,
      Color? textColor,
      Color? backgroundColor,
      Duration? duration,
      double? elevation,
      Function()? onTapped}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: textColor == null
            ? TextStyle(color: Colors.white)
            : TextStyle(color: textColor),
      ),
      elevation: elevation == null ? 4.0 : elevation,
      padding: EdgeInsets.all(2.0),
      backgroundColor: backgroundColor == null
          ? Theme.of(context).primaryColor
          : backgroundColor,
      duration: duration == null ? Duration(seconds: 10) : duration,
    ));
  }

  static showErrorSnackBar(
      {required BuildContext context,
      required String message,
      Color? textColor,
      Color? backgroundColor,
      Duration? duration,
      double? elevation,
      Function()? onTapped}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: TextStyle(color: textColor == null ? Colors.white : textColor),
      ),
      elevation: elevation == null ? 4.0 : elevation,
      padding: EdgeInsets.all(8.0),
      backgroundColor:
          backgroundColor == null ? Colors.pink[600] : backgroundColor,
      duration: duration == null ? Duration(seconds: 10) : duration,
    ));
  }
}
