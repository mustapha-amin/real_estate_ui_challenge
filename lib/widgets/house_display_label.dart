import 'package:flutter/material.dart';
import 'package:real_estate_ui_challenge/model/house.dart';
import 'package:real_estate_ui_challenge/utils/extensions.dart';
import 'package:real_estate_ui_challenge/utils/textstyle.dart';

class HouseDisplayLabel extends StatelessWidget {
  final House house;
  const HouseDisplayLabel({required this.house, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              house.address!,
              style: kTextStyle(
                15,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 18,
                  ),
                  Text(
                    house.rating!.toStringAsFixed(1),
                    style: kTextStyle(15),
                  )
                ],
              ).padAll(4),
            )
          ],
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$${house.price}/month",
              style: kTextStyle(
                15,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "1 Room meet",
              style: kTextStyle(
                15,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ],
    ).padAll(8);
  }
}
