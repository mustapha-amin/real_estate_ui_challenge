import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_ui_challenge/model/house.dart';
import 'package:real_estate_ui_challenge/utils/extensions.dart';
import 'package:real_estate_ui_challenge/utils/textstyle.dart';
import 'package:real_estate_ui_challenge/widgets/more_images.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class DetailScreen extends StatefulWidget {
  House? house;
  DetailScreen({this.house, super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int? lastWord;
  bool isExpanded = false;
  bool isTapped = false;
  int index1 = Random().nextInt(10) + 1;
  int index2 = Random().nextInt(10) + 1;
  int index3 = Random().nextInt(10) + 1;

  @override
  void initState() {
    super.initState();
    lastWord = 15;
  }

  Icon? ratingIcon(int index) {
    if (index < widget.house!.rating! || index == widget.house!.rating) {
      return const Icon(
        Icons.star,
        color: Colors.amber,
      );
    } else if (index - widget.house!.rating! < 0.8) {
      return const Icon(
        Icons.star_half,
        color: Colors.amber,
      );
    } else {
      return Icon(
        Icons.star_border,
        color: Colors.amber[200]!,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Hero(
                      tag: widget.house!.imagePath!,
                      child: Image.asset(
                        widget.house!.imagePath!,
                        height: context.screenHeight * .5,
                        width: context.screenWidth,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      left: 7,
                      top: 20,
                      child: IconButton.filledTonal(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                    ),
                    MoreImages(
                      moreImagesIndices: [index1, index2, index3],
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        for (int i = 0; i < 5; i++) ratingIcon(i + 1)!,
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.house!.address!,
                          style: kTextStyle(23, isBold: true),
                        ),
                        AnimatedScale(
                          scale: isTapped ? 1.5 : 1,
                          duration: const Duration(milliseconds: 200),
                          child: IconButton(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onPressed: () {
                              setState(() {
                                widget.house!.isLiked = !widget.house!.isLiked!;
                                isTapped = true;
                                Future.delayed(
                                    const Duration(milliseconds: 200),
                                    () => setState(() => isTapped = false));
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
                          ),
                        )
                      ],
                    ),
                    Text(
                      "Description",
                      style: kTextStyle(17, isBold: true),
                    ).padY(10),
                    Wrap(
                      alignment: WrapAlignment.start,
                      runAlignment: WrapAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: widget.house!.details!
                                .split(' ')
                                .sublist(0, lastWord)
                                .join(' '),
                            style: kTextStyle(13, color: Colors.grey[500]),
                            children: [
                              TextSpan(
                                  text:
                                      isExpanded ? " Read less" : " Read more",
                                  style: kTextStyle(
                                    13,
                                    color: Colors.lightBlueAccent,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      setState(() {
                                        lastWord = !isExpanded
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
                    const SizedBox(height: 10),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "assets/images/map.jpg",
                            width: double.infinity,
                            height: 60.h,
                          ),
                        ),
                        const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 40,
                        )
                      ],
                    ),
                  ],
                ).padX(15),
              ],
            ),
          ),
          SizedBox(
              height: 10.h,
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
                  ),
                ],
              ).padX(15))
        ],
      ),
    );
  }
}
