import 'package:flutter/material.dart';

import '../const/colors.dart';
import '../screens/homeScreen.dart';
import '../screens/menuScreen/menuScreen.dart';
import '../screens/moreScreen.dart';
import '../screens/offerScreen.dart';
import '../screens/profileScreen.dart';
import '../utils/helper.dart';

class CustomNavBar extends StatelessWidget {
  final bool home;
  final bool menu;
  final bool offer;
  final bool profile;
  final bool more;

  const CustomNavBar(
      {Key key,
      this.home = false,
      this.menu = false,
      this.offer = false,
      this.profile = false,
      this.more = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 80,
            width: Helper.getScreenWidth(context),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: Colors.white,
            child: Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (!menu) {
                        Navigator.of(context)
                            .pushReplacementNamed(MenuScreen.routeName);
                      }
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        menu
                            ? Image.asset(
                                Helper.getAssetName("", ""),
                              )
                            : Image.asset(
                                Helper.getAssetName("menu.png", "icons8"),
                              ),
                        menu
                            ? Text("Menu",
                                style: TextStyle(color: AppColor.orange))
                            : Text("Menu"),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (!offer) {
                        Navigator.of(context)
                            .pushReplacementNamed(OfferScreen.routeName);
                      }
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        offer
                            ? Image.asset(
                                Helper.getAssetName("", ""),
                              )
                            : Image.asset(
                                Helper.getAssetName("order.png", "icons8"),
                              ),
                        offer
                            ? Text("Order",
                                style: TextStyle(color: AppColor.orange))
                            : Text("Order"),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (!home) {
                        Navigator.of(context)
                            .pushReplacementNamed(HomeScreen.routeName);
                      }
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        home
                            ? Image.asset(
                                Helper.getAssetName("", ""),
                              )
                            : Image.asset(
                                Helper.getAssetName("home.png", "icons8"),
                              ),
                        home
                            ? Text("Home",
                                style: TextStyle(color: AppColor.orange))
                            : Text("Home"),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (!profile) {
                        Navigator.of(context)
                            .pushReplacementNamed(ProfileScreen.routeName);
                      }
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        profile
                            ? Image.asset(
                                Helper.getAssetName("", ""),
                              )
                            : Image.asset(
                                Helper.getAssetName("profile.png", "icons8"),
                              ),
                        profile
                            ? Text("Profile",
                                style: TextStyle(color: AppColor.orange))
                            : Text("Profile"),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (!more) {
                        Navigator.of(context)
                            .pushReplacementNamed(MoreScreen.routeName);
                      }
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        more
                            ? Image.asset(
                                Helper.getAssetName("", ""),
                              )
                            : Image.asset(
                                Helper.getAssetName("setting.png", "icons8"),
                              ),
                        more
                            ? Text("Setting",
                                style: TextStyle(color: AppColor.orange))
                            : Text("Setting"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
