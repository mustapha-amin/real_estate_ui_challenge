import 'package:flutter/material.dart';

kTextStyle(double fontSize, {Color? color, FontWeight? fontWeight}) {
  return TextStyle(
    fontSize: fontSize,
    color: color ?? Colors.black,
    fontWeight: fontWeight ?? FontWeight.normal,
    fontFamily: "Montserrat",
  );
}
