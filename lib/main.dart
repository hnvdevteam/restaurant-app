import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:monkey_app_demo/routes.dart';
import 'package:monkey_app_demo/screens/homeScreen/homeScreen.dart';
import 'package:monkey_app_demo/screens/individualItem/individualItem.dart';
import 'package:monkey_app_demo/screens/introScreen/introScreen.dart';
import 'package:monkey_app_demo/screens/landingScreen/landingScreen.dart';
import 'package:monkey_app_demo/screens/logInScreen/loginScreen.dart';
import 'package:monkey_app_demo/screens/newPwScreen/newPwScreen.dart';
import 'package:monkey_app_demo/screens/notificationScreen/notificationScreen.dart';
import 'package:monkey_app_demo/screens/sentOTPScreen/sentOTPScreen.dart';
import 'package:monkey_app_demo/screens/signUpScreen/signUpScreen.dart';
import 'package:monkey_app_demo/screens/splashScreen/splashScreen.dart';
import 'package:monkey_app_demo/theme.dart';
import 'package:monkey_app_demo/widgets/layout.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeData,
      home: NewPwScreen(),
      routes: AppRoutes.routes,
    );
  }
}
