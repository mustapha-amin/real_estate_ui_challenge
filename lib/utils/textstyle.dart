import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

kTextStyle(double fontSize, {Color? color, bool? isBold = false}) {
  return TextStyle(
    fontSize: fontSize.sp,
    color: color ?? Colors.black,
    fontWeight: isBold! ? FontWeight.w700 : FontWeight.normal,
    fontFamily: "Lato",
  );
}
