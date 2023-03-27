import 'package:flutter/material.dart';
import 'package:monkey_app_demo/const/layoutBar.dart';
import 'package:monkey_app_demo/widgets/customAppBar.dart';
import 'package:monkey_app_demo/widgets/customBottomNavBar.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen(this.currentIndex, {Key key}) : super(key: key);
  final int currentIndex;
  @override
  _LayoutScreenState createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int _currentIndex;

  @override
  void initState() {
    _currentIndex = widget.currentIndex;
    super.initState();
  }

  void _handleItemTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: appBarTitleManagement[_currentIndex],
        ),
        body: bottomWidgetManagement[_currentIndex],
        bottomNavigationBar: CustomBottomNavBar(_currentIndex, onItemTapped: _handleItemTap));
  }
}
