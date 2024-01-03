import 'package:flutter/material.dart';
import 'package:real_estate_ui_challenge/screens/home.dart';

class BtmNavBar extends StatefulWidget {
  const BtmNavBar({super.key});

  @override
  State<BtmNavBar> createState() => _BtmNavBarState();
}

class _BtmNavBarState extends State<BtmNavBar> {
  List<Widget> screens = [const Home()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: 0,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.lightBlueAccent,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Setting",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
