import 'package:flutter/material.dart';
import 'package:monkey_app_demo/const/colors.dart';
import 'package:monkey_app_demo/model/item.dart';
import 'package:monkey_app_demo/utils/helper.dart';
import 'package:monkey_app_demo/widgets/customAppBarParent.dart';
import 'package:monkey_app_demo/widgets/searchBar.dart';
import 'package:monkey_app_demo/widgets/slidable_widget.dart';

import 'data.dart';

class OfferScreen extends StatefulWidget {
  @override
  State<OfferScreen> createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  List<Order_Item> items = List.of(Data.orders);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(246, 246, 254, 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(10, 5, 10, 0),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                children: [
                  CustomAppBarParent(title: "Food", subTitle: "Of the best"),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: SearchBar(title: "Food name"),
                  ),
                  Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.only(top: 10, bottom: 45),
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return SlidableWidget(
                          child: buildListTile(item),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          Container(height: 15),
                      itemCount: items.length,
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

  Widget buildListTile(Order_Item items) {
    bool filter;

    if (items.quantity < 1) {
      filter = true;
    } else {
      filter = false;
    }

    return createBlackAndWhiteWidget(
      Container(
        color: Colors.white,
        height: 85,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 70,
                  width: 70,
                  child: Image.asset(
                    Helper.getAssetName("hamburger.jpg", "real"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      items.name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                items.ingredients,
                                style: TextStyle(
                                  color: AppColor.secondary,
                                  fontSize: 13,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "\$ " + items.price,
                                style: TextStyle(
                                  color: Color.fromRGBO(62, 218, 134, 1),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            alignment: Alignment.center,
                            width: 100,
                            height: 35,
                            color: Color.fromRGBO(62, 218, 134, 1),
                            child: Text(
                              'Process',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
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
          ],
        ),
      ),
      applyFilter: filter,
    );
  }

  Widget createBlackAndWhiteWidget(Widget child, {bool applyFilter}) {
    if (applyFilter) {
      return ColorFiltered(
        colorFilter: ColorFilter.matrix([
          0.2126,
          0.7152,
          0.0722,
          0,
          0,
          0.2126,
          0.7152,
          0.0722,
          0,
          0,
          0.2126,
          0.7152,
          0.0722,
          0,
          0,
          0,
          0,
          0,
          1,
          0,
        ]),
        child: child,
      );
    } else {
      return child;
    }
  }
}
