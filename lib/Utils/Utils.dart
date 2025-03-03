import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class Utils{

  /// Focus for textFormField;
  static void fieldFocusChange(BuildContext context,FocusNode current,FocusNode nextFocus){
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  /// Email validation for the LoginForm
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email cannot be empty";
    }
    final emailPattern =
        r"^[a-zA-Z0-9]+@[a-zA-Z]+\.[a-zA-Z]{2,}$";
    final regex = RegExp(emailPattern);
    if (!regex.hasMatch(value)) {
      return "Enter a valid email address";
    }
    return null;
  }


  /// Password Validation for the Login Form
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password cannot be empty";
    } else if (value.length < 6) {
      return "Password must be at least 6 characters";
    }
    return null;
  }

  /// toastMessage
  static toastMessage(String message){
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.red

    );
  }

  ///snackBar Message
  static snackBar(String title,String message){
    Get.snackbar(
      title,
      message,
      colorText: Colors.white,
      backgroundColor: Colors.green,
    );

  }




}