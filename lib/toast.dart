
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project/Helper/app_color.dart';
void makeToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: AppColors.primaryColor,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT);
}
getImagePath(String name,{String suffix='png'}){
  return 'assets/data/$name.$suffix';
}