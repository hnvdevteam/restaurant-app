import 'package:flutter/material.dart';
import 'package:monkey_app_demo/const/colors.dart';
import 'package:monkey_app_demo/model/item.dart';
import 'package:monkey_app_demo/widgets/customAppBar.dart';
import 'package:monkey_app_demo/widgets/customBottomNavBar.dart';
import 'package:monkey_app_demo/widgets/slidable_widget.dart';

import 'data.dart';

class MenuScreen extends StatefulWidget {
  static const routeName = "/menuScreen";

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  List<Item> items = List.of(Data.items);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Restaurants',
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          itemBuilder: (context, index) {
            if (index == items.length) {
              return adddListTile();
            } else {
              final item = items[index];
              return Container(
                child: SlidableWidget(
                  child: buildListTile(item),
                ),
              );
            }
          },
          separatorBuilder: (context, index) => Container(height: 10),
          itemCount: items.length + 1,
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        restaurant: true,
      ),
    );
  }

  Widget buildListTile(Item items) => Container(
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
      );

  Widget adddListTile() => Container(
        height: 85,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColor.placeholder,
              offset: Offset(0, 5),
              blurRadius: 10,
            )
          ],
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
