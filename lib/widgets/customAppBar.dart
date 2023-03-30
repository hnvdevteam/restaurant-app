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
      leading: GestureDetector(
        onTap: () {
          Scaffold.of(context).openDrawer();
        },
        child: Icon(Icons.menu),
      ),
      title: Container(
        alignment: Alignment.center,
        width: double.infinity,
        color: Colors.blueAccent,
        child: Text(
          title,
          style: Helper.getTheme(context).headline5,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
