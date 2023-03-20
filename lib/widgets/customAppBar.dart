import 'package:flutter/material.dart';
import 'package:monkey_app_demo/utils/helper.dart';

class CustomAppBar extends StatefulWidget {
  final String title;

  CustomAppBar({this.title});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  DateTime now = DateTime.now();
  String weekdayName;

  @override
  void initState() {
    super.initState();
    now = DateTime.now();
    List<String> weekdays = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
    weekdayName = weekdays[now.weekday - 1];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          weekdayName + ", ${now.day}/${now.month}/${now.year}",
          style: Helper.getTheme(context).caption,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Icon(Icons.menu),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  widget.title,
                  style: Helper.getTheme(context).headline5,
                ),
              ],
            ),
            ClipOval(
              child: Container(
                height: 40,
                width: 40,
                child: Image.asset(
                  Helper.getAssetName(
                    "user1.jpg",
                    "real",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
