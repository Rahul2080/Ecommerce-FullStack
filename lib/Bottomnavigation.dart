import 'package:flutter/material.dart';

import 'Favourite.dart';
import 'Home.dart';
import 'Search.dart';
import 'Settings.dart';

class Bottomnavigation extends StatefulWidget {
  const Bottomnavigation({super.key});

  @override
  State<Bottomnavigation> createState() => _BottomnavigationState();
}

class _BottomnavigationState extends State<Bottomnavigation> {
  final navigation = [Home(), Favourite(), Search(), Settings()];
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(showSelectedLabels: false,
        backgroundColor: Colors.yellow,
        onTap: (index) {
          setState(() {
            currentindex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: currentindex == 0 ? Color(0xFFF6C354) : Colors.black,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border,
                  color: currentindex == 1 ? Color(0xFFF6C354) : Colors.black),
              label: "notification"),
          BottomNavigationBarItem(
              icon: Icon(Icons.search,
                  color: currentindex == 2 ? Color(0xFFF6C354) : Colors.black),
              label: "cart"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings,
                  color: currentindex == 3 ? Color(0xFFF6C354) : Colors.black),
              label: "account"),

        ],
      ),
      body: navigation[currentindex],


    );
  }
}
