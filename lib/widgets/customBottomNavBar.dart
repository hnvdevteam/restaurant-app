import 'package:flutter/material.dart';
import 'package:monkey_app_demo/const/colors.dart';
import 'package:monkey_app_demo/const/layoutBar.dart';

class CustomBottomNavBar extends StatelessWidget {
  final Function(int) onItemTapped;
  int _selectedIndex = 0;

  CustomBottomNavBar(int selectedIndex, {this.onItemTapped}) {
    _selectedIndex = selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColor.placeholder,
          width: 0.5,
        ),
        boxShadow: [
          BoxShadow(
              color: AppColor.placeholder,
              offset: Offset(0, 5),
              blurRadius: 10),
        ],
      ),
      child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: AppColor.orange,
          unselectedItemColor: Colors.grey,
          currentIndex: _selectedIndex,
          onTap: (int index) => onItemTapped(index),
          items: bottomItemManagement),
    );
  }
}
