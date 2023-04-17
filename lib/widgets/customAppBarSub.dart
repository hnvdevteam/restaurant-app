import 'package:flutter/material.dart';

class CustomAppBarSub extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  CustomAppBarSub({this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 40,
                  width: 40,
                  color: Color.fromARGB(40, 255, 153, 0),
                  child: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.orange,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Builder(
                builder: (context) => GestureDetector(
                  onTap: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    color: Color.fromARGB(40, 255, 153, 0),
                    child: Icon(
                      Icons.menu,
                      color: Colors.orange,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.only(top: 15),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
