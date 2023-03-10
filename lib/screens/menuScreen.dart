import 'dart:math';

import 'package:flutter/material.dart';
import 'package:monkey_app_demo/const/colors.dart';
import 'package:monkey_app_demo/screens/dessertScreen.dart';
import 'package:monkey_app_demo/utils/helper.dart';
import 'package:monkey_app_demo/widgets/customNavBar.dart';
import 'package:monkey_app_demo/widgets/searchBar.dart';

class MenuScreen extends StatelessWidget {
  static const routeName = "/menuScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Menu",
                        style: Helper.getTheme(context).headline5,
                      ),
                      Image.asset(
                        Helper.getAssetName("cart.png", "virtual"),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SearchBar(title: "Search Food"),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                    height: Helper.getScreenHeight(context) * 0.6,
                    width: Helper.getScreenWidth(context),
                    child: Stack(
                      children: [
                        Container(
                          height: double.infinity,
                          width: 100,
                          decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                ),
                              ),
                              color: AppColor.orange),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MenuCard(
                                image: "western2.jpg",
                                file: "real",
                                name: "Food",
                                count: "120",
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              MenuCard(
                                image: "coffee2.jpg",
                                file: "real",
                                name: "Beverage",
                                count: "220",
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(DessertScreen.routeName);
                                },
                                child: MenuCard(
                                  image: "dessert.jpg",
                                  file: "real",
                                  name: "Desserts",
                                  count: "135",
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              MenuCard(
                                image: "hamburger3.jpg",
                                file: "real",
                                name: "Promotions",
                                count: "25",
                              ),
                            ],
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: CustomNavBar(
              menu: true,
            ),
          )
        ],
      ),
    );
  }
}

class MenuCard extends StatefulWidget {
  const MenuCard({
    Key key,
    @required String name,
    @required String count,
    @required String image,
    @required String file,
  })  : _name = name,
        _count = count,
        _image = image,
        _file = file,
        super(key: key);

  final String _name;
  final String _count;
  final String _image;
  final String _file;

  @override
  State<MenuCard> createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  Animation<double> scale;
  Animation<double> translate;
  Animation<double> opacity;
  Animation<double> rotation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    scale = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOutBack,
      ),
    );
    translate = Tween<double>(begin: 0, end: 60).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOutBack,
      ),
    );
    opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.3, .5),
      ),
    );
    rotation = Tween<double>(begin: pi, end: 0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0, .7, curve: Curves.easeInOut),
      ),
    );
  }

  Widget _buildMenuOption({
    double angle,
    Widget icon,
    Color color,
    double translateEnd,
  }) {
    return Opacity(
      opacity: opacity.value,
      child: Transform(
        transform: Matrix4.identity()
          ..translate(
            (translate.value - translateEnd) * cos(degreeToRadian(angle)),
          ),
        child: FloatingActionButton(
          backgroundColor: color,
          child: icon,
          onPressed: () {
            // if (controller.status == controller.isCompleted) {
            //   controller.reverse();
            // } else {
            //   controller.forward();
            // }
          },
        ),
      ),
    );
  }

  double degreeToRadian(double degree) {
    return degree * pi / 180;
  }

  _open() {
    controller.forward();
  }

  _close() {
    controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 80,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: AppColor.placeholder,
                offset: Offset(0, 5),
                blurRadius: 10,
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 60,
                    width: 60,
                    child: Image.asset(
                      Helper.getAssetName(widget._image, widget._file),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget._name,
                        style: Helper.getTheme(context).headline4.copyWith(
                              color: AppColor.primary,
                            ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("${widget._count} items")
                    ],
                  ),
                ),
              ),
              Container(
                height: 80,
                child: AnimatedBuilder(
                  animation: controller.view,
                  builder: (context, _) {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        _buildMenuOption(
                          translateEnd: 0,
                          angle: 180,
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          color: const Color(0xFF0073F5),
                        ),
                        _buildMenuOption(
                          translateEnd: -60,
                          angle: 180,
                          icon: const Icon(
                            Icons.facebook,
                            color: Colors.white,
                          ),
                          color: const Color(0xFF0073F5),
                        ),
                        Transform.scale(
                          scale: scale.value - 1,
                          child: FloatingActionButton(
                            backgroundColor: Colors.red,
                            onPressed: _close,
                            child: const Icon(Icons.close),
                          ),
                        ),
                        Transform.rotate(
                          angle: rotation.value,
                          child: Transform.scale(
                            scale: scale.value,
                            child: FloatingActionButton(
                              backgroundColor: Colors.greenAccent,
                              onPressed: _open,
                              child: const Icon(Icons.menu),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
