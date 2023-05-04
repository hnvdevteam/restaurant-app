import 'package:flutter/material.dart';
import 'package:monkey_app_demo/routes.dart';

import '../../utils/helper.dart';
import '../../widgets/customTextInput.dart';
import '../sentOTPScreen/sentOTPScreen.dart';

class ForgetPwScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Helper.getScreenWidth(context),
        height: Helper.getScreenWidth(context),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 30,
            ),
            child: Column(
              children: [
                Text(
                  "Reset Password",
                  style: Helper.getTheme(context).headline6,
                ),
                Spacer(),
                Text(
                  "Please enter your email to recieve a link to create a new password via email",
                  textAlign: TextAlign.center,
                ),
                Spacer(flex: 2),
                CustomTextInput(hintText: "Email"),
                Spacer(),
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: double.infinity,
                      color: Color.fromRGBO(62, 218, 134, 1),
                      child: Text(
                        "Send",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
