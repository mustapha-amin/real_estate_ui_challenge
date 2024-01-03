library mockapi;

import 'dart:math';

import 'package:real_estate_ui_challenge/model/house.dart';

part 'mock_data.dart';

class MockApi {
  static Future<List<House>> fetchData() async {
    await Future.delayed(const Duration(seconds: 3));
    return List.generate(
      10,
      (index) => House(
        address: "${streets[index]}, \n${cities[index]}",
        details: houseDetails[index],
        price: Random().nextInt(200) + 100,
        rating: 1 + Random().nextDouble() * 5,
        imagePath: 'assets/images/house${index + 1}.jpg',
        isLiked: false,
      ),
    );
  }
}
