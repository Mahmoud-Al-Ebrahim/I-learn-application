import 'package:flutter/material.dart';

class MyFontStyle {

  static TextStyle lightStyle(
      double fontSize,
      Color color,
      {
        TextDecoration?
        textDecoration,
        double? height,
      }) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontFamily: 'nexa light',
      height: height,
      decoration: textDecoration,
    );
  }
  static TextStyle bookStyle(
      double fontSize,
      Color color,
      {
        TextDecoration?
        textDecoration,
        double? height}) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontFamily: 'nexa book',
      height: height,
      decoration: textDecoration,
    );
  }

  static TextStyle boldStyle(
      double fontSize,
      Color color,
      {
        TextDecoration?
        textDecoration,
        double? height}) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontFamily: 'nexa bold',
      height: height,
      decoration: textDecoration,
    );
  }


}