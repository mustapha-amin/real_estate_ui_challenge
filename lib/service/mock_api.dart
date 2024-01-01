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
        address: "${streets[index]}, ${cities[index]}",
        details: houseDetails[index],
        price: Random().nextInt(200) + 100,
        rating: Random().nextDouble() + 1 * 6,
        imagePath: 'images/house${index + 1}.jpg',
      ),
    );
  }
}
