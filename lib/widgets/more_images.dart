import 'package:flutter/material.dart';
import 'package:real_estate_ui_challenge/utils/extensions.dart';
import 'package:real_estate_ui_challenge/utils/textstyle.dart';

class MoreImages extends StatelessWidget {
  List<int>? moreImagesIndices;
  MoreImages({this.moreImagesIndices, super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 5,
      bottom: 10,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              "assets/images/house${moreImagesIndices![0]}.jpg",
              width: context.screenWidth * .18,
              height: context.screenWidth * .18,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              width: context.screenWidth * .18,
              height: context.screenWidth * .18,
              "assets/images/house${moreImagesIndices![1]}.jpg",
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  width: context.screenWidth * .18,
                  height: context.screenWidth * .18,
                  "assets/images/house${moreImagesIndices![2]}.jpg",
                  fit: BoxFit.cover,
                  color: Colors.black.withOpacity(0.5),
                  colorBlendMode: BlendMode.dstATop,
                ),
                Text(
                  "+5",
                  style: kTextStyle(18, color: Colors.white, isBold: true),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
