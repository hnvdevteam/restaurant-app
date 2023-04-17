import 'package:flutter/material.dart';
import 'package:monkey_app_demo/screens/homeScreen/homeScreen.dart';
import 'package:monkey_app_demo/screens/menuScreen/menuScreen.dart';
import 'package:monkey_app_demo/screens/moreScreen.dart';
import 'package:monkey_app_demo/screens/foodList/offerScreen.dart';
import 'package:monkey_app_demo/screens/profileScreen.dart';

List<String> appBarTitleManagement = <String>[
  "Restaurants",
  "FoodList",
  "Tables",
  "Profile",
  "More"
];

List<Widget> bottomWidgetManagement = <Widget>[
  MenuScreen(),
  OfferScreen(),
  HomeScreen(),
  ProfileScreen(),
  MoreScreen(),
];

const List<BottomNavigationBarItem> bottomItemManagement =
    <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: Icon(Icons.menu),
    label: 'Restaurants',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.shopping_cart),
    label: 'Foodlist',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.person),
    label: 'Profile',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.more_vert),
    label: 'More',
  ),
];
