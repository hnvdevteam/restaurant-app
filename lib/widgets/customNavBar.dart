import 'package:flutter/material.dart';

import '../const/colors.dart';
import '../screens/homeScreen/homeScreen.dart';
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
    return Container(
      decoration:
          BoxDecoration(border: Border.all(color: Colors.grey, width: 0.5)),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 80,
              width: Helper.getScreenWidth(context),
              padding: const EdgeInsets.symmetric(horizontal: 25),
              color: Colors.white,
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
                                Helper.getAssetName(
                                    "menu_icons8.png", "virtual"),
                              )
                            : Image.asset(
                                Helper.getAssetName(
                                    "menu_icons8.png", "virtual"),
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
                                Helper.getAssetName(
                                    "order_icons8.png", "virtual"),
                              )
                            : Image.asset(
                                Helper.getAssetName(
                                    "order_icons8.png", "virtual"),
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
                                Helper.getAssetName(
                                    "home_icons8.png", "virtual"),
                              )
                            : Image.asset(
                                Helper.getAssetName(
                                    "home_icons8.png", "virtual"),
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
                                Helper.getAssetName(
                                    "profile_icons8.png", "virtual"),
                              )
                            : Image.asset(
                                Helper.getAssetName(
                                    "profile_icons8.png", "virtual"),
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
                                Helper.getAssetName(
                                    "more_icons8.png", "virtual"),
                              )
                            : Image.asset(
                                Helper.getAssetName(
                                    "more_icons8.png", "virtual"),
                              ),
                        more
                            ? Text("More",
                                style: TextStyle(color: AppColor.orange))
                            : Text("More"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
