import 'package:flutter/material.dart';
import 'package:monkey_app_demo/screens/forgetPwScreen/forgetPwScreen.dart';
import 'package:monkey_app_demo/screens/homeScreen/homeScreen.dart';
import 'package:monkey_app_demo/screens/individualItem/individualItem.dart';
import 'package:monkey_app_demo/screens/introScreen/introScreen.dart';
import 'package:monkey_app_demo/screens/landingScreen/landingScreen.dart';
import 'package:monkey_app_demo/screens/logInScreen/loginScreen.dart';
import 'package:monkey_app_demo/screens/menuScreen/menuScreen.dart';
import 'package:monkey_app_demo/screens/myOrderScreen/myOrderScreen.dart';
import 'package:monkey_app_demo/screens/newPwScreen/newPwScreen.dart';
import 'package:monkey_app_demo/screens/notificationScreen/notificationScreen.dart';
import 'package:monkey_app_demo/screens/foodListScreen/offerScreen.dart';
import 'package:monkey_app_demo/screens/sentOTPScreen/sentOTPScreen.dart';
import 'package:monkey_app_demo/screens/signUpScreen/signUpScreen.dart';
import 'package:monkey_app_demo/widgets/layout.dart';

class AppRoutes {
  static const String home = '/home';
  static const String login = '/login';
  static const String profile = '/profile';
  static const String about = '/about';
  static const String changeAddress = '/changeAddress';
  static const String checkout = '/checkout';
  static const String dessert = '/dessert';
  static const String forgetPassword = '/forgetPassword';
  static const String inbox = '/inbox';
  static const String individual = '/individual';
  static const String intro = '/intro';
  static const String landing = '/landing';
  static const String more = '/more';
  static const String newPassword = '/newPassword';
  static const String notification = '/notification';
  static const String offer = '/offer';
  static const String payment = '/payment';
  static const String sendOTP = '/sendOTP';
  static const String signUp = '/signUp';
  static const String menu = '/menu';
  static const String myOrder = '/myOrder';
  static const String layout = '/layout';

  static final Map<String, WidgetBuilder> routes = {
    home: (context) => HomeScreen(),
    login: (context) => LoginScreen(),
    layout: (context) => LayoutScreen(0),
    landing: (context) => LandingScreen(),
    signUp: (context) => SignUpScreen(),
    forgetPassword: (context) => ForgetPwScreen(),
    sendOTP: (context) => SendOTPScreen(),
    newPassword: (context) => NewPwScreen(),
    intro: (context) => IntroScreen(),
    menu: (context) => MenuScreen(),
    offer: (context) => OfferScreen(),
    individual: (context) => IndividualItem(),
    notification: (context) => NotificationScreen(),
    myOrder: (context) => MyOrderScreen(),
  };
}
