import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:real_estate_ui_challenge/model/house.dart';
import 'package:real_estate_ui_challenge/screens/detail.dart';
import 'package:real_estate_ui_challenge/utils/extensions.dart';

class HouseDisplay extends StatefulWidget {
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
  State<HouseDisplay> createState() => _HouseDisplayState();
}

class _HouseDisplayState extends State<HouseDisplay>
    with AutomaticKeepAliveClientMixin {
  @override

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(AssetImage(widget.house.imagePath!), context);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () => context.push(
        DetailScreen(
          house: widget.house,
        ),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              widget.house.imagePath!,
              width: double.infinity,
              height: widget.height,
              fit: BoxFit.cover,
              color: Colors.black.withOpacity(0.6),
              colorBlendMode: BlendMode.overlay,
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
          widget.child,
        ],
      ).padAll(15),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
