import 'package:flutter/material.dart';

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
        color: Color.fromARGB(40, 255, 153, 0),
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.orange,
            ),
            hintText: title,
            hintStyle: TextStyle(
              color: Color.fromARGB(166, 255, 153, 0),
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
