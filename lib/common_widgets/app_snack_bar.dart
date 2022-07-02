import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class AppSnackBar {
  final String? message;
  final String? actionText;
  final VoidCallback? onPressed;
  final Color? color;

  const AppSnackBar(
      {required this.message, this.actionText, this.onPressed, this.color});

  Future<void> showAppSnackBar(BuildContext context) async {
    TextButton actionButton;
    if (actionText != null && onPressed != null) {
      actionButton = TextButton(
        onPressed: onPressed,
        child: Text(
          actionText!,
          style: TextStyle(color: Colors.white),
        ),
      );
    }
    Flushbar(
      backgroundColor: color ?? Colors.green,
      messageText: Text(
        message as String,
        textAlign: TextAlign.left,
        softWrap: true,
        style: TextStyle(color: Colors.white),
      ),
      duration: Duration(seconds: 3),
      // mainButton: actionButton ,
    ).show(context);
    await Future.delayed(Duration(seconds: 3));
    return;
  }
}
