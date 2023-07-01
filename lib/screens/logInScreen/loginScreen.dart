import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:monkey_app_demo/core/auth_state.dart';
import 'package:monkey_app_demo/core/storage_state.dart';
import 'package:monkey_app_demo/routes.dart';

import '../../const/colors.dart';
import '../../utils/helper.dart';
import '../../widgets/customTextInput.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    ref.listen(authErrorMessageProvider, (prev, next) {
      if (next.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next),
          ),
        );
      } else {
        emailController.text = '';
        passwordController.text = '';
      }
    });

    return Scaffold(
      body: Container(
        height: Helper.getScreenHeight(context),
        width: Helper.getScreenWidth(context),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 30,
            ),
            child: Column(
              children: [
                Text(
                  "Login",
                  style: Helper.getTheme(context).headline6,
                ),
                Spacer(),
                Text('Add your details to login'),
                Spacer(),
                CustomTextInput(
                  hintText: "Your email",
                  controller: emailController,
                ),
                Spacer(),
                CustomTextInput(
                  hintText: "password",
                  controller: passwordController,
                  obscureText: true,
                ),
                Spacer(),
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: GestureDetector(
                    onTap: () async {
                      if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
                        final authArgs = AuthArgs(
                          email: emailController.text,
                          password: passwordController.text
                        );
                        ref.read(authLoginProvider(authArgs));
                        final isAuthenticated = ref.read(getIsAuthenticatedProvider);
                        if (isAuthenticated.value) {
                          Navigator.pushNamed(context, 'Home');
                        }
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: double.infinity,
                      color: Color.fromRGBO(62, 218, 134, 1),
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed(AppRoutes.forgetPassword);
                  },
                  child: Text("Forget your password?"),
                ),
                Spacer(
                  flex: 2,
                ),
                Text("or Login With"),
                Spacer(),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Color(
                          0xFF367FC0,
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Helper.getAssetName(
                            "fb.png",
                            "virtual",
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text("Login with Facebook")
                      ],
                    ),
                  ),
                ),
                Spacer(),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Color(
                          0xFFDD4B39,
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Helper.getAssetName(
                            "google.png",
                            "virtual",
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text("Login with Google")
                      ],
                    ),
                  ),
                ),
                Spacer(
                  flex: 4,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed(AppRoutes.signUp);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an Account?"),
                      Text(
                        "Sign Up",
                        style: TextStyle(
                          color: AppColor.greenAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
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
