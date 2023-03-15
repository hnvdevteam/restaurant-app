import 'package:flutter/material.dart';
import 'package:monkey_app_demo/const/colors.dart';
import 'package:monkey_app_demo/utils/helper.dart';
import 'package:monkey_app_demo/widgets/customNavBar.dart';
import 'package:monkey_app_demo/widgets/searchBar.dart';

import '../../widgets/slidable_widget.dart';
import 'data.dart';
import '../../model/item.dart';

class MenuScreen extends StatefulWidget {
  static const routeName = "/menuScreen";

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  List<Item> items = List.of(Data.chats);

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
                    vertical: 10,
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
                SearchBar(title: "Search Food"),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          final item = items[index];
                          return SlidableWidget(
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColor.placeholder,
                                    offset: Offset(0, 5),
                                    blurRadius: 10,
                                  )
                                ],
                              ),
                              child: buildListTile(item),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            Container(height: 15),
                        itemCount: items.length),
                  ),
                ),
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

  Widget buildListTile(Item items) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: GestureDetector(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            child: Row(
              children: [
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      items.url,
                      width: 75,
                      height: 75,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        items.name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text("Address: " + items.info),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
