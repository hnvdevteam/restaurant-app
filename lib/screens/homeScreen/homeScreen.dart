import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:monkey_app_demo/const/colors.dart';
import 'package:monkey_app_demo/model/item.dart';
import 'package:monkey_app_demo/widgets/customTextInput.dart';
import 'package:monkey_app_demo/widgets/home/tableWidget.dart';
import 'package:monkey_app_demo/widgets/searchBar.dart';

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
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(10, 5, 10, 0),
          child: Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: SearchBar(title: "Table number"),
                  ),
                  Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.only(top: 1, bottom: 1),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 25,
                        crossAxisSpacing: 15,
                        childAspectRatio: 1.1,
                      ),
                      itemBuilder: (context, index) {
                        if (index == items.length) {
                          return addListTile();
                        } else {
                          final item = items[index];
                          return TableWidget(item);
                        }
                      },
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

  Widget addListTile() => Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: GestureDetector(
          onTap: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('AlertDialog Title'),
              content: CustomTextInput(hintText: "asd",),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK'),
                ),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                foregroundColor: AppColor.greenAccent,
                backgroundColor: AppColor.greenBg,
                child: Icon(
                  Icons.add,
                ),
              ),
            ],
          ),
        ),
      );
}
