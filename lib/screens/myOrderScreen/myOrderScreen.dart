import 'package:flutter/material.dart';
import 'package:monkey_app_demo/const/colors.dart';
import 'package:monkey_app_demo/model/item.dart';
import 'package:monkey_app_demo/screens/checkoutScreen.dart';
import 'package:monkey_app_demo/utils/helper.dart';

import 'data.dart';

class MyOrderScreen extends StatefulWidget {
  static const routeName = "/myOrderScreen";

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  List<Order_Item> items = List.of(Data.orders);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return SizedBox(
                          height: 40,
                        );
                      } else {
                        final item = items[index - 1];
                        return buildListTile(item);
                      }
                    },
                    separatorBuilder: (context, index) => Container(height: 0),
                    itemCount: items.length + 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: AppColor.placeholder.withOpacity(0.25),
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Delivery Instruction",
                                style: Helper.getTheme(context).headline3,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.add,
                                    color: AppColor.orange,
                                  ),
                                  Text(
                                    "Add Notes",
                                    style: TextStyle(
                                      color: AppColor.orange,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Sub Total",
                              style: Helper.getTheme(context).headline3,
                            ),
                          ),
                          Text(
                            "\$68",
                            style: Helper.getTheme(context).headline3.copyWith(
                                  color: AppColor.orange,
                                ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Delivery Cost",
                              style: Helper.getTheme(context).headline3,
                            ),
                          ),
                          Text(
                            "\$2",
                            style: Helper.getTheme(context).headline3.copyWith(
                                  color: AppColor.orange,
                                ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: AppColor.placeholder.withOpacity(0.25),
                        thickness: 1.5,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Total",
                              style: Helper.getTheme(context).headline3,
                            ),
                          ),
                          Text(
                            "\$70",
                            style: Helper.getTheme(context).headline3.copyWith(
                                  color: AppColor.orange,
                                  fontSize: 22,
                                ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipOval(
                    child: Container(
                      color: Color.fromARGB(200, 150, 150, 150),
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_rounded,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 40,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        alignment: Alignment.center,
                        color: Color.fromARGB(100, 150, 150, 150),
                        child: Row(
                          children: [
                            Text(
                              "Table",
                              style: Helper.getTheme(context)
                                  .headline6
                                  .copyWith(color: Colors.black),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Image.asset(
                              Helper.getAssetName("dropdown.png", "virtual"),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  ClipOval(
                    child: Container(
                      color: Color.fromARGB(200, 150, 150, 150),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.menu),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(CheckoutScreen.routeName);
          },
          child: Text("Checkout"),
        ),
      ),
    );
  }
}

Widget buildListTile(Order_Item items) => Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {},
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Icon(Icons.delete, color: Colors.white),
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 25),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColor.placeholder.withOpacity(0.25),
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                items.name + " x" + items.quantity,
                style: TextStyle(
                  color: AppColor.primary,
                  fontSize: 16,
                ),
              ),
            ),
            Text(
              items.price,
              style: TextStyle(
                color: AppColor.primary,
                fontSize: 16,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
