import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:real_estate_ui_challenge/model/house.dart';
import 'package:real_estate_ui_challenge/screens/detail.dart';
import 'package:real_estate_ui_challenge/utils/extensions.dart';

class HouseDisplay extends StatelessWidget {
  final House house;
  final double height;
  final Widget child;
  const HouseDisplay({
    required this.house,
    required this.height,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () => context.push(
        DetailScreen(
          house: house,
        ),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              house.imagePath!,
              width: double.infinity,
              height: height,
              fit: BoxFit.cover,
            ),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
              child: Container(
                color: Colors.transparent,
                width: context.screenWidth,
                height: context.screenHeight * .13,
              ),
            ),
          ),
          child,
        ],
      ).padAll(15),
    );
  }
}
