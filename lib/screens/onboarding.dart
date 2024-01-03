import 'package:flutter/material.dart';
import 'package:real_estate_ui_challenge/screens/bttm_nav_bar.dart';
import 'package:real_estate_ui_challenge/screens/home.dart';
import 'package:real_estate_ui_challenge/utils/extensions.dart';
import 'package:real_estate_ui_challenge/utils/textstyle.dart';
import 'package:real_estate_ui_challenge/widgets/estate_app_bar.dart';
import 'package:sizer/sizer.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool isAnimating = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(seconds: 1),
        () => setState(() {
              isAnimating = !isAnimating;
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const EstateAppBarTitle()),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 25),
          SizedBox(
            height: 50.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedOpacity(
                  opacity: isAnimating ? 1 : 0,
                  duration: const Duration(seconds: 3),
                  curve: Curves.fastOutSlowIn,
                  child: Text.rich(
                    TextSpan(
                      text: "Looking ",
                      style: kTextStyle(
                        30,
                        color: Colors.lightBlueAccent,
                        isBold: true,
                      ),
                      children: [
                        TextSpan(
                          text: "for an\n",
                          style: kTextStyle(
                            30,
                            color: Colors.amber,
                            isBold: true,
                          ),
                        ),
                        TextSpan(
                          text: "elegant house this \nis the place",
                          style: kTextStyle(
                            30,
                            isBold: true,
                          ),
                        )
                      ],
                    ),
                  ).padX(18),
                ),
                const SizedBox(height: 15),
                AnimatedOpacity(
                  opacity: isAnimating ? 1 : 0,
                  duration: const Duration(seconds: 2),
                  curve: Curves.fastOutSlowIn,
                  child: Text(
                    "Welcome friends, are you looking \nfor us?\n\nCongratulations you have found us",
                    style: kTextStyle(16, color: Colors.grey),
                  ).padX(18),
                ),
                const SizedBox(height: 15),
                AnimatedPadding(
                  padding: EdgeInsets.only(left: isAnimating ? 18 : 5),
                  duration: const Duration(seconds: 2),
                  curve: Curves.fastOutSlowIn,
                  child: SizedBox(
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
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return const BtmNavBar();
                        }));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Next",
                              style: kTextStyle(16, color: Colors.white)),
                          const Icon(Icons.arrow_forward),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: AnimatedOpacity(
              opacity: isAnimating ? 1 : 0,
              duration: const Duration(seconds: 2),
                  curve: Curves.fastOutSlowIn,
              child: Image.asset(
                "assets/images/house.png",
                width: context.screenWidth,
              ),
            ),
          )
        ],
      ),
    );
  }
}
