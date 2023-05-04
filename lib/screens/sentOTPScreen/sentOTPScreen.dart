import 'package:flutter/material.dart';
import 'package:monkey_app_demo/routes.dart';

import '../../const/colors.dart';
import '../../utils/helper.dart';

class SendOTPScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'We have sent you an OTP to your Mobile',
              style: Helper.getTheme(context).headline6,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Please check your mobile number 071*****12 continue to reset your password",
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OTPInput(),
                OTPInput(),
                OTPInput(),
                OTPInput(),
                OTPInput(),
                OTPInput(),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(AppRoutes.newPassword);
                },
                child: Text("Next"),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Didn't Recieve? "),
                Text(
                  "Click Here",
                  style: TextStyle(
                    color: AppColor.greenAccent,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}

class OTPInput extends StatelessWidget {
  const OTPInput({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: ShapeDecoration(
        color: AppColor.placeholderBg,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: TextField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "*",
        ),
        style: TextStyle(fontSize: 35),
      ),
    );
  }
}
