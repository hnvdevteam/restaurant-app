import 'package:flutter/material.dart';
import 'package:monkey_app_demo/utils/helper.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  CustomAppBar({this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      foregroundColor: Colors.grey,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {},
            child: Icon(Icons.menu),
          ),
          Text(
            title,
            style: Helper.getTheme(context).headline5,
          ),
          ClipOval(
            child: Container(
              height: 45,
              width: 45,
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
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
