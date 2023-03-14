import 'package:flutter/material.dart';
import 'package:monkey_app_demo/const/colors.dart';
import 'package:monkey_app_demo/utils/helper.dart';
import 'package:monkey_app_demo/widgets/customNavBar.dart';
import 'package:monkey_app_demo/widgets/searchBar.dart';

import '../../widgets/slidable_widget.dart';
import 'data.dart';
import 'model/item.dart';

class MenuScreen extends StatelessWidget {
  static const routeName = "/menuScreen";
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
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              final item = items[index];
                              return SlidableWidget(
                                child: buildListTile(item),
                              );
                            },
                            separatorBuilder: (context, index) => Divider(),
                            itemCount: items.length),
                      ),
                    ],
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

  Widget buildListTile(Item items) => Stack(
        children: [
          Container(
            height: 80,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 80,
            ),
            decoration: BoxDecoration(
              color: Color.fromARGB(158, 235, 235, 235),
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            leading: CircleAvatar(
              radius: 28,
              backgroundImage: NetworkImage(items.url),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  items.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(items.info),
              ],
            ),
            onTap: () {},
          ),
        ],
      );
}
