import 'package:flutter/material.dart';
import 'package:real_estate_ui_challenge/screens/home.dart';
import 'package:real_estate_ui_challenge/utils/extensions.dart';
import 'package:real_estate_ui_challenge/utils/textstyle.dart';
import 'package:real_estate_ui_challenge/widgets/estate_app_bar.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const EstateAppBarTitle()),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 25),
          Text.rich(
            TextSpan(
              text: "Looking ",
              style: kTextStyle(
                30,
                color: Colors.lightBlueAccent,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: "for an\n",
                  style: kTextStyle(
                    30,
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: "elegant house this \nis the place",
                  style: kTextStyle(
                    30,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ).padX(18),
          const SizedBox(height: 15),
          Text(
            "Welcome friends, are you looking \nfor us?\n\nCongratulations you have found us",
            style: kTextStyle(16, color: Colors.grey),
          ).padX(18),
          const SizedBox(height: 15),
          SizedBox(
            width: context.screenWidth * .34,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                context.push(const Home());
              },
              child: Row(
                children: [
                  Text("Next", style: kTextStyle(16, color: Colors.white)),
                  const Icon(Icons.arrow_forward),
                ],
              ),
            ),
          ).padX(18),
          Expanded(
            child: Image.asset(
              "assets/images/house.png",
              width: context.screenWidth,
            ),
          )
        ],
      ),
    );
  }
}
