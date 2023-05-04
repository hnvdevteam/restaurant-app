import 'package:flutter/material.dart';
import 'package:monkey_app_demo/model/item.dart';
import 'package:monkey_app_demo/routes.dart';
import 'package:monkey_app_demo/utils/helper.dart';

import '../../const/colors.dart';

class TableWidget extends StatelessWidget {
  final Table_Item tableItem;

  TableWidget(this.tableItem);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(AppRoutes.myOrder),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color:  AppColor.greenBg,
                    borderRadius: BorderRadius.all(Radius.circular(18))),
                padding: const EdgeInsets.all(12),
                child: Image.asset(Helper.getAssetName(tableItem.reservation == "Using" ? "fork_spoon_open.png" : "fork_spoon_close.png", "real")),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              "Table " + tableItem.id,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                // color: AppColor.greenAccent
              ),
            ),
          ],
        ));
  }
}
