import 'package:flutter/material.dart';
import 'package:monkey_app_demo/const/colors.dart';

class SearchBar extends StatelessWidget {
  final String title;

  SearchBar({@required this.title});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: 50,
        width: double.infinity,
        color: AppColor.greenBg,
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: AppColor.greenAccent,
            ),
            hintText: title,
            hintStyle: TextStyle(
              color: AppColor.greenAccent,
              fontSize: 18,
            ),
            contentPadding: const EdgeInsets.only(
              top: 17,
            ),
          ),
        ),
      ),
    );
  }
}
