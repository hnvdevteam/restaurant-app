import 'package:flutter/material.dart';
import 'package:monkey_app_demo/const/colors.dart';
import 'package:monkey_app_demo/model/item.dart';
import 'package:monkey_app_demo/widgets/customAppBar.dart';
import 'package:monkey_app_demo/widgets/customBottomNavBar.dart';

import 'data.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/homeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Table_Item> items = List.of(Data.table);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Tables',
      ),
      body: SafeArea(
        child: GridView.builder(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            childAspectRatio: 3,
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
      ),
      bottomNavigationBar: CustomBottomNavBar(
        home: true,
      ),
    );
  }

  Widget buildListTile(Table_Item items) => Container(
        height: 85,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "ID: " + items.id,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Total: " + items.total,
                ),
                Text(
                  "Status: " + items.reservation,
                )
              ],
            ),
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
            ],
          ),
        ),
      );
}
