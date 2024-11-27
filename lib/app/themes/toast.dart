
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

abstract class ShowToast{
  static toast(String message, Color color) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: color,
      textColor: Colors.black,
      fontSize: 16.0,
    );
  }

}
