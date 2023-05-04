import 'package:flutter/material.dart';
import 'package:monkey_app_demo/screens/homeScreen/homeScreen.dart';
import 'package:monkey_app_demo/screens/menuScreen/menuScreen.dart';
import 'package:monkey_app_demo/screens/foodListScreen/offerScreen.dart';

List<String> appBarTitleManagement = <String>[
  "Restaurants",
  "FoodList",
  "Tables",
];

List<Widget> bottomWidgetManagement = <Widget>[
  MenuScreen(),
  OfferScreen(),
  HomeScreen(),
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
];
