import 'package:flutter/material.dart';
import 'package:real_estate_ui_challenge/utils/textstyle.dart';

class EstateAppBarTitle extends StatelessWidget {
  const EstateAppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Icon(
          Icons.house,
          size: 30,
        ),
        Text.rich(
          TextSpan(
            text: "Home",
            style: kTextStyle(
              25,
              color: Colors.lightBlueAccent,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: "bhase",
                style: kTextStyle(
                  25,
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
