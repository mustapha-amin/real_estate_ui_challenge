import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_ui_challenge/model/house.dart';
import 'package:real_estate_ui_challenge/utils/extensions.dart';
import 'package:real_estate_ui_challenge/utils/textstyle.dart';

// ignore: must_be_immutable
class DetailScreen extends StatefulWidget {
  House? house;
  DetailScreen({this.house, super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int? lastChar;
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    lastChar = 15;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        widget.house!.imagePath!,
                        height: context.screenHeight * .5,
                        width: context.screenWidth,
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.house!.address!,
                            style: kTextStyle(25, isBold: true),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                widget.house!.isLiked = !widget.house!.isLiked!;
                              });
                            },
                            icon: Icon(
                              widget.house!.isLiked!
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: widget.house!.isLiked!
                                  ? Colors.red
                                  : Colors.black,
                              size: 30,
                            ),
                          )
                        ],
                      ),
                      Text(
                        "Description",
                        style: kTextStyle(15, isBold: true),
                      ).padY(10),
                      Wrap(
                        alignment: WrapAlignment.start,
                        runAlignment: WrapAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: widget.house!.details!
                                  .split(' ')
                                  .sublist(0, lastChar)
                                  .join(' '),
                              style: kTextStyle(13, color: Colors.grey),
                              children: [
                                TextSpan(
                                    text: isExpanded
                                        ? " Read less"
                                        : " Read more",
                                    style: kTextStyle(
                                      13,
                                      color: Colors.lightBlueAccent,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        setState(() {
                                          lastChar = !isExpanded
                                              ? widget.house!.details!
                                                  .split(' ')
                                                  .length
                                              : 15;
                                          isExpanded = !isExpanded;
                                        });
                                      })
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ).padX(15),
                ],
              ),
            ),
            SizedBox(
              height: context.screenHeight * .13,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      text: "Price\n",
                      style: kTextStyle(15),
                      children: [
                        TextSpan(
                          text: "\$${widget.house!.price}",
                          style: kTextStyle(20, isBold: true),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlueAccent,
                    ),
                    onPressed: () {},
                    child: Text(
                      "Pay now",
                      style: kTextStyle(15, color: Colors.white, isBold: true),
                    ),
                  )
                ],
              ).padX(15),
            )
          ],
        ),
      ),
    );
  }
}
