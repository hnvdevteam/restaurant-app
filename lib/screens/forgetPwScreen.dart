import 'package:flutter/material.dart';
import 'package:monkey_app_demo/routes.dart';

import '../utils/helper.dart';
import '../widgets/customTextInput.dart';

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
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(AppRoutes.sendOTP);
                    },
                    child: Text("Send"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
