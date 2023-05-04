import 'package:flutter/material.dart';

import '../const/colors.dart';

class CustomTextInput extends StatelessWidget {
  const CustomTextInput({
    @required String hintText,
    EdgeInsets padding = const EdgeInsets.only(left: 40),
    Key key,
  })  : _hintText = hintText,
        _padding = padding,
        super(key: key);

  final String _hintText;
  final EdgeInsets _padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey, width: 0.05),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: Color.fromARGB(105, 194, 216, 235), spreadRadius: 0.1, blurRadius: 20)
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: _hintText,
          hintStyle: TextStyle(
            color: AppColor.placeholder,
          ),
          contentPadding: _padding,
        ),
      ),
    );
  }
}
