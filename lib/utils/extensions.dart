import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;

  void push(Widget screen) {
    Navigator.push(this, MaterialPageRoute(builder: (context) => screen));
  }

}

extension WidgetExtensions on Widget {
  Widget padX(double? size) => Padding(
        padding: EdgeInsets.symmetric(horizontal: size!),
        child: this,
      );

  Widget padY(double? size) => Padding(
        padding: EdgeInsets.symmetric(vertical: size!),
        child: this,
      );

  Widget padAll(double? size) => Padding(
        padding: EdgeInsets.all(size!),
        child: this,
      );
}
