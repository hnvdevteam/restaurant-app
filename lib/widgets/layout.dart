import 'package:flutter/material.dart';
import 'package:monkey_app_demo/const/layoutBar.dart';
import 'package:monkey_app_demo/widgets/customAppBar.dart';
import 'package:monkey_app_demo/widgets/customBottomNavBar.dart';

class LayoutScreen extends StatefulWidget {
  static const routeName = "/LayoutScreen";
  int currentIndex = 0;
  LayoutScreen(this.currentIndex) {
    currentIndex = this.currentIndex;
  }

  @override
  _LayoutScreenState createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {



  void _handleItemTap(int index) {
    setState(() {
      widget.currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: appBarTitleManagement[widget.currentIndex],
        ),
        body: bottomWidgetManagement[widget.currentIndex],
        bottomNavigationBar: CustomBottomNavBar(widget.currentIndex,
            onItemTapped: _handleItemTap));
  }
}
