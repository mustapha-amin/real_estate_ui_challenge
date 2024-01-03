import 'package:flutter/material.dart';
import 'package:real_estate_ui_challenge/service/mock_api.dart';
import 'package:real_estate_ui_challenge/utils/extensions.dart';
import 'package:real_estate_ui_challenge/utils/textstyle.dart';
import 'package:real_estate_ui_challenge/widgets/estate_app_bar.dart';
import 'package:real_estate_ui_challenge/widgets/house_display.dart';
import 'package:real_estate_ui_challenge/widgets/house_display_label.dart';
import '/model/house.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<House>> houses;

  @override
  void initState() {
    super.initState();
    houses = MockApi.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const EstateAppBarTitle(),
        actions: [
          const Icon(
            Icons.notifications_none,
            size: 25,
          ).padX(13),
        ],
      ),
      body: Center(
        child: FutureBuilder(
          future: houses,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              House? firstHouse = snapshot.data![0];
              House? secondHouse = snapshot.data![1];
              List<House> remainingHouses =
                  snapshot.data!.sublist(0, snapshot.data!.length);
              return ListView(
                children: [
                  SizedBox(
                    height: context.screenHeight * .08,
                    child: SearchBar(
                      elevation: const MaterialStatePropertyAll(1),
                      hintText: "Search here",
                      hintStyle: MaterialStatePropertyAll(
                        kTextStyle(16, color: Colors.grey),
                      ),
                      trailing: const [
                        Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                      ],
                    ).padX(10),
                  ),
                  HouseDisplay(
                    house: firstHouse,
                    height: context.screenHeight * .2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Let's buy a house\nhere",
                          style: kTextStyle(
                            18,
                            color: Colors.white,
                            isBold: true,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Disount 10%",
                              style: kTextStyle(
                                15,
                                color: Colors.white,
                                isBold: true,
                              ),
                            ),
                            Text(
                              "1 January 2024",
                              style: kTextStyle(
                                15,
                                color: Colors.white,
                                isBold: true,
                              ),
                            ),
                          ],
                        )
                      ],
                    ).padAll(15),
                  ),
                  HouseDisplay(
                    house: secondHouse,
                    height: context.screenHeight * .28,
                    child: HouseDisplayLabel(house: secondHouse),
                  ),
                  SizedBox(
                    height: 20,
                    child: Text(
                      "Popular today",
                      style: kTextStyle(20, isBold: true),
                    ),
                  ).padX(15),
                  ...remainingHouses.map(
                    (house) => HouseDisplay(
                      house: house,
                      height: context.screenHeight * .28,
                      child: HouseDisplayLabel(house: house),
                    ),
                  )
                ],
              );
            } else {
              return const CircularProgressIndicator.adaptive();
            }
          },
        ),
      ),
    );
  }
}
