import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecommerceapp2/Cart.dart';
import 'package:ecommerceapp2/Profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Favourite.dart';
import 'Home.dart';
import 'Search.dart';

class Bottomnavigation extends StatefulWidget {
  const Bottomnavigation({super.key});

  @override
  State<Bottomnavigation> createState() => _BottomnavigationState();
}

class _BottomnavigationState extends State<Bottomnavigation> {
  final navigation = [Home(), Favourite(),Cart(), Search(), Profile()];
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.white,
        animationCurve: Curves.easeInOut,
        backgroundColor: Colors.white,
        height: 50.h,
        animationDuration: Duration(milliseconds: 500 ),
        onTap: (index) {
          setState(() {
            currentindex = index;
          });
        },
        items: [
          Icon(Icons.home,
              color: currentindex == 0 ? Colors.black: Colors.black),
          Icon(Icons.favorite_border,
              color: currentindex == 1 ? Colors.red : Colors.black),
          Icon(Icons.shopping_cart_outlined,
              color: currentindex == 0 ? Colors.black: Colors.black),
          Icon(Icons.search,
              color: currentindex == 2 ? Colors.black :Colors.black),
          Icon(Icons.person_outlined,
              color: currentindex == 3 ? Colors.black : Colors.black),

        ],
      ),
      body: navigation[currentindex],


    );
  }
}
