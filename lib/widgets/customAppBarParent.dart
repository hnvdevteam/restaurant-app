import 'package:flutter/material.dart';

import '../const/colors.dart';

class CustomAppBarParent extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;

  CustomAppBarParent({this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Choose Your",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColor.placeholder,
                  offset: Offset(0, 5),
                  blurRadius: 15,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: Colors.white,
                child: Icon(
                  Icons.notifications,
                  color: Colors.greenAccent,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
