import 'package:flutter/material.dart';
import 'package:monkey_app_demo/const/colors.dart';
import 'package:monkey_app_demo/model/item.dart';
import 'package:monkey_app_demo/screens/myOrderScreen/myOrderScreen.dart';
import 'package:intl/intl.dart';

import 'data.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/homeScreen";

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
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
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
    Color boxColor = items.reservation == "" ? Colors.green : Colors.red;

// Color boxColor;

// if (items.reserved == "") {
//   boxColor = Colors.green;
// } else if (items.reserved == "Using") {
//   boxColor = Colors.red;
// } else if (items.reserved == "Reserved") {
//   boxColor = Colors.yellow;
// }

// return Container(
//   color: boxColor,
//   // Các thuộc tính khác của Container()
// );

// Color boxColor = items.reserved == "" ? Colors.green : items.reserved == "Using" ? Colors.red : Colors.yellow;

// return Container(
//   color: boxColor,
//   // Các thuộc tính khác của Container()
// );

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(MyOrderScreen.routeName);
      },
      child: Container(
        padding: EdgeInsets.only(top: 2, left: 2, right: 2, bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: boxColor,
          boxShadow: [
            BoxShadow(
              color: AppColor.placeholder,
              offset: Offset(0, 5),
              blurRadius: 10,
            )
          ],
        ),
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
