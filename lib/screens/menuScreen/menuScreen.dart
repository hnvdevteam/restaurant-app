import 'package:flutter/material.dart';
import 'package:monkey_app_demo/const/colors.dart';
import 'package:monkey_app_demo/model/item.dart';
import 'package:monkey_app_demo/model/restaurant.dart';
import 'package:monkey_app_demo/utils/helper.dart';
import 'package:monkey_app_demo/widgets/customAppBarParent.dart';
import 'package:monkey_app_demo/widgets/slidable_widget.dart';

import 'data.dart';

class MenuScreen extends StatefulWidget {
  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  List<Item> items = List.of(Data.items);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.placeholderBg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(10, 15, 10, 0),
          child: Stack(
            children: [
              Column(
                children: [
                  CustomAppBarParent(title: "Restaurant"),
                  Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      itemBuilder: (context, index) {
                        if (index == items.length) {
                          return adddListTile();
                        } else {
                          final item = items[index];
                          return SlidableWidget(
                            child: buildListTile(item),
                          );
                        }
                      },
                      separatorBuilder: (context, index) =>
                          Container(height: 10),
                      itemCount: items.length + 1,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildListTile(Item items) => Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: GestureDetector(
          onTap: () {},
          child: Row(
            children: [
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(items.url,
                      width: 75, height: 75, fit: BoxFit.cover),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        items.name,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          SizedBox(
                            height: 15,
                            child: Image.asset(
                              Helper.getAssetName(
                                "loc.png",
                                "virtual",
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          Expanded(
                            child: Text(
                              "Address: " + items.info,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget adddListTile() => Container(
        height: 85,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: GestureDetector(
          onTap: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                foregroundColor: Colors.white,
                backgroundColor: AppColor.placeholder,
                child: Icon(
                  Icons.add,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text('Add')
            ],
          ),
        ),
      );
}
