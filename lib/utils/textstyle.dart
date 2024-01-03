import 'package:flutter/material.dart';

kTextStyle(double fontSize, {Color? color, bool? isBold = false}) {
  return TextStyle(
    fontSize: fontSize,
    color: color ?? Colors.black,
    fontWeight: isBold! ? FontWeight.w700 : FontWeight.normal,
    fontFamily: "Lato",
  );
}
