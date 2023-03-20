import 'package:flutter/material.dart';

import '../const/colors.dart';
import '../screens/homeScreen/homeScreen.dart';
import '../screens/menuScreen/menuScreen.dart';
import '../screens/moreScreen.dart';
import '../screens/offerScreen.dart';
import '../screens/profileScreen.dart';

class CustomBottomNavBar extends StatefulWidget {
  final bool home;
  final bool menu;
  final bool offer;
  final bool profile;
  final bool more;

  const CustomBottomNavBar(
      {Key key,
      this.home = false,
      this.menu = false,
      this.offer = false,
      this.profile = false,
      this.more = false})
      : super(key: key);

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    MenuScreen(),
    OfferScreen(),
    HomeScreen(),
    ProfileScreen(),
    MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColor.placeholder,
          width: 0.5,
        ),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: AppColor.orange,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    _widgetOptions.elementAt(_selectedIndex)),
          );
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Order',
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
        ],
      ),
    );
  }
}