import 'package:flutter/material.dart';
import 'package:monkey_app_demo/const/colors.dart';
import 'package:monkey_app_demo/model/item.dart';
import 'package:monkey_app_demo/routes.dart';
import 'package:monkey_app_demo/utils/helper.dart';

import 'data.dart';

class MyOrderScreen extends StatefulWidget {
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
                          height: 90,
                        );
                      } else {
                        final item = items[index - 1];
                        return buildListTile(item);
                      }
                    },
                    separatorBuilder: (context, index) => Container(height: 15),
                    itemCount: items.length + 1,
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
                //   child: Column(
                //     children: [
                //       Container(
                //         height: 50,
                //         decoration: BoxDecoration(
                //           border: Border(
                //             bottom: BorderSide(
                //               color: AppColor.placeholder.withOpacity(0.25),
                //             ),
                //           ),
                //         ),
                //         child: Row(
                //           children: [
                //             Expanded(
                //               child: Text(
                //                 "Delivery Instruction",
                //                 style: Helper.getTheme(context).headline3,
                //               ),
                //             ),
                //             GestureDetector(
                //               onTap: () {},
                //               child: Row(
                //                 crossAxisAlignment: CrossAxisAlignment.center,
                //                 children: [
                //                   Icon(
                //                     Icons.add,
                //                     color: AppColor.orange,
                //                   ),
                //                   Text(
                //                     "Add Notes",
                //                     style: TextStyle(
                //                       color: AppColor.orange,
                //                     ),
                //                   )
                //                 ],
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //       SizedBox(
                //         height: 15,
                //       ),
                //       Row(
                //         children: [
                //           Expanded(
                //             child: Text(
                //               "Sub Total",
                //               style: Helper.getTheme(context).headline3,
                //             ),
                //           ),
                //           Text(
                //             "\$68",
                //             style: Helper.getTheme(context).headline3.copyWith(
                //                   color: AppColor.orange,
                //                 ),
                //           ),
                //         ],
                //       ),
                //       SizedBox(
                //         height: 10,
                //       ),
                //       Row(
                //         children: [
                //           Expanded(
                //             child: Text(
                //               "Delivery Cost",
                //               style: Helper.getTheme(context).headline3,
                //             ),
                //           ),
                //           Text(
                //             "\$2",
                //             style: Helper.getTheme(context).headline3.copyWith(
                //                   color: AppColor.orange,
                //                 ),
                //           ),
                //         ],
                //       ),
                //       SizedBox(
                //         height: 10,
                //       ),
                //       Divider(
                //         color: AppColor.placeholder.withOpacity(0.25),
                //         thickness: 1.5,
                //       ),
                //       SizedBox(
                //         height: 10,
                //       ),
                //       Row(
                //         children: [
                //           Expanded(
                //             child: Text(
                //               "Total",
                //               style: Helper.getTheme(context).headline3,
                //             ),
                //           ),
                //           Text(
                //             "\$70",
                //             style: Helper.getTheme(context).headline3.copyWith(
                //                   color: AppColor.orange,
                //                   fontSize: 22,
                //                 ),
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: AppColor.placeholder,
                              offset: Offset(0, 5),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              color: Colors.white,
                              child: Icon(
                                Icons.arrow_back_ios_rounded,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: SizedBox(),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: AppColor.placeholder,
                              offset: Offset(0, 5),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Builder(
                            builder: (context) => GestureDetector(
                              onTap: () {
                                Scaffold.of(context).openEndDrawer();
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                color: Colors.white,
                                child: Icon(Icons.menu),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      "Order details",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      endDrawer: Drawer(),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(AppRoutes.checkout);
            },
            child: Container(
              height: 50,
              alignment: Alignment.center,
              color: AppColor.orange,
              child: Text(
                "Checkout",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
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
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Image.asset(
                Helper.getAssetName("hamburger.jpg", "real"),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Expanded(
                    child: Text(
                      items.name,
                      overflow: TextOverflow.ellipsis,
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
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: GestureDetector(
                      onTap: () {
                        print("-");
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 40,
                        color: Colors.red,
                        child: Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 40,
                    child: Text(
                      items.quantity.toString(),
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: GestureDetector(
                      onTap: () {
                        print("+");
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 40,
                        color: Colors.green,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
