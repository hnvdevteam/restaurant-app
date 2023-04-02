import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:monkey_app_demo/const/colors.dart';
import 'package:monkey_app_demo/model/item.dart';
import 'package:monkey_app_demo/routes.dart';

import 'data.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Table_Item> items = List.of(Data.table);

  String formattedDate = DateFormat('h:mm:ss a').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GridView.builder(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          childAspectRatio: 1.2,
        ),
        itemBuilder: (context, index) {
          if (index == items.length) {
            return adddListTile();
          } else {
            final item = items[index];
            return buildListTile(item);
          }
        },
        itemCount: items.length + 1,
      ),
    );
  }

  Widget buildListTile(Table_Item items) {
    Color boxColor;

    if (items.reservation == "") {
      boxColor = AppColor.placeholderBg;
    } else if (items.reservation == "Using") {
      boxColor = Colors.red;
    } else if (items.reservation == "Reserved") {
      boxColor = Colors.yellow;
    }

    return Container(
      padding: EdgeInsets.only(top: 2, left: 2, right: 2, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: boxColor,
        boxShadow: [
          BoxShadow(
            color: AppColor.placeholder,
            offset: Offset(0, 5),
            blurRadius: 10,
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(AppRoutes.myOrder);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                items.id,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                items.total + ' ₫',
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                formattedDate,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget adddListTile() => Container(
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
            ],
          ),
        ),
      );
}
