import 'package:flutter/material.dart';
import 'package:monkey_app_demo/utils/helper.dart';
import 'package:monkey_app_demo/widgets/customDrawer.dart';

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
          Builder(
            builder: (context) => GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Icon(Icons.menu),
            ),
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
      drawer: CustomDrawer(),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
