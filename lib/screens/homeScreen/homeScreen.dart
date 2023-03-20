import 'package:flutter/material.dart';
import 'package:monkey_app_demo/model/item.dart';

import '../../const/colors.dart';
import '../../utils/helper.dart';
import '../../widgets/customBottomNavBar.dart';
import '../../widgets/searchBar.dart';
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
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Good morning Akila!",
                        style: Helper.getTheme(context).headline5,
                      ),
                      Image.asset(
                        Helper.getAssetName("cart.png", "virtual"),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 15, right: 15),
                  child: Text("Deilivering to"),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: DropdownButtonHideUnderline(
                    child: SizedBox(
                      width: 250,
                      child: DropdownButton(
                        value: "current location",
                        items: [
                          DropdownMenuItem(
                            child: Text("Current Location"),
                            value: "current location",
                          ),
                        ],
                        icon: Image.asset(
                          Helper.getAssetName("dropdown_filled.png", "virtual"),
                        ),
                        style: Helper.getTheme(context).headline4,
                        onChanged: (_) {},
                      ),
                    ),
                  ),
                ),
                SearchBar(
                  title: "Search Food",
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      childAspectRatio: 3,
                    ),
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return buildListTile(item);
                    },
                    itemCount: items.length,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        home: true,
      ),
    );
  }

  Widget buildListTile(Table_Item items) => Container(
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
}

class RecentItemCard extends StatelessWidget {
  const RecentItemCard({
    Key key,
    @required String name,
    @required Image image,
  })  : _name = name,
        _image = image,
        super(key: key);

  final String _name;
  final Image _image;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 80,
            height: 80,
            child: _image,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Container(
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _name,
                  style: Helper.getTheme(context)
                      .headline4
                      .copyWith(color: AppColor.primary),
                ),
                Row(
                  children: [
                    Text("Cafe"),
                    SizedBox(
                      width: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Text(
                        ".",
                        style: TextStyle(
                          color: AppColor.orange,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Western Food"),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      Helper.getAssetName("star_filled.png", "virtual"),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "4.9",
                      style: TextStyle(
                        color: AppColor.orange,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text('(124) Ratings')
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
