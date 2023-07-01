import 'package:flutter/material.dart';
import 'package:monkey_app_demo/const/colors.dart';

class CustomTextInput extends StatelessWidget {
  const CustomTextInput({
    bool obscureText = false,
    String hintText = "",
    EdgeInsets padding = const EdgeInsets.only(left: 20, right: 20),
     TextEditingController controller,
    keyboardType = TextInputType.text,
    String Function(String) validator,
    Key key,
  })  : _obscureText = obscureText,
        _hintText = hintText,
        _padding = padding,
        _validator = validator,
        _controller = controller,
        _keyboardType = keyboardType,
        super(key: key);

  final TextEditingController _controller;
  final TextInputType _keyboardType;
  final bool _obscureText;
  final String _hintText;
  final EdgeInsets _padding;
  final String Function(String) _validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 50,
      decoration: ShapeDecoration(
        color: AppColor.placeholderBg,
        shape: StadiumBorder(),
      ),
      child: TextFormField(
        obscureText: _obscureText,
        controller: _controller,
        keyboardType: _keyboardType,
        validator: _validator,
        autocorrect: false,
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
