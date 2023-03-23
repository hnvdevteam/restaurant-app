import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:monkey_app_demo/const/colors.dart';
import 'package:monkey_app_demo/screens/aboutScreen.dart';
import 'package:monkey_app_demo/screens/changeAddressScreen.dart';
import 'package:monkey_app_demo/screens/checkoutScreen.dart';
import 'package:monkey_app_demo/screens/dessertScreen.dart';
import 'package:monkey_app_demo/screens/forgetPwScreen.dart';
import 'package:monkey_app_demo/screens/homeScreen/homeScreen.dart';
import 'package:monkey_app_demo/screens/inboxScreen.dart';
import 'package:monkey_app_demo/screens/individualItem.dart';
import 'package:monkey_app_demo/screens/introScreen.dart';
import 'package:monkey_app_demo/screens/landingScreen.dart';
import 'package:monkey_app_demo/screens/loginScreen.dart';
import 'package:monkey_app_demo/screens/menuScreen/menuScreen.dart';
import 'package:monkey_app_demo/screens/moreScreen.dart';
import 'package:monkey_app_demo/screens/myOrderScreen/myOrderScreen.dart';
import 'package:monkey_app_demo/screens/newPwScreen.dart';
import 'package:monkey_app_demo/screens/notificationScreen.dart';
import 'package:monkey_app_demo/screens/offerScreen.dart';
import 'package:monkey_app_demo/screens/paymentScreen.dart';
import 'package:monkey_app_demo/screens/profileScreen.dart';
import 'package:monkey_app_demo/screens/sentOTPScreen.dart';
import 'package:monkey_app_demo/screens/signUpScreen.dart';
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
      theme: ThemeData(
        fontFamily: "Metropolis",
        primarySwatch: Colors.red,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              AppColor.orange,
            ),
            shape: MaterialStateProperty.all(
              StadiumBorder(),
            ),
            elevation: MaterialStateProperty.all(0),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(
              AppColor.orange,
            ),
          ),
        ),
        textTheme: TextTheme(
          headline3: TextStyle(
            color: AppColor.primary,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          headline4: TextStyle(
            color: AppColor.secondary,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          headline5: TextStyle(
            color: AppColor.primary,
            fontWeight: FontWeight.normal,
            fontSize: 25,
          ),
          headline6: TextStyle(
            color: AppColor.primary,
            fontSize: 25,
          ),
          bodyText2: TextStyle(
            color: AppColor.secondary,
          ),
        ),
      ),
      home: LayoutScreen(0),
      routes: {
        LayoutScreen.routeName: (context) => LayoutScreen(0),
        LandingScreen.routeName: (context) => LandingScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        SignUpScreen.routeName: (context) => SignUpScreen(),
        ForgetPwScreen.routeName: (context) => ForgetPwScreen(),
        SendOTPScreen.routeName: (context) => SendOTPScreen(),
        NewPwScreen.routeName: (context) => NewPwScreen(),
        IntroScreen.routeName: (context) => IntroScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        MenuScreen.routeName: (context) => MenuScreen(),
        OfferScreen.routeName: (context) => OfferScreen(),
        ProfileScreen.routeName: (context) => ProfileScreen(),
        MoreScreen.routeName: (context) => MoreScreen(),
        DessertScreen.routeName: (context) => DessertScreen(),
        IndividualItem.routeName: (context) => IndividualItem(),
        PaymentScreen.routeName: (context) => PaymentScreen(),
        NotificationScreen.routeName: (context) => NotificationScreen(),
        AboutScreen.routeName: (context) => AboutScreen(),
        InboxScreen.routeName: (context) => InboxScreen(),
        MyOrderScreen.routeName: (context) => MyOrderScreen(),
        CheckoutScreen.routeName: (context) => CheckoutScreen(),
        ChangeAddressScreen.routeName: (context) => ChangeAddressScreen(),
      },
    );
  }
}
