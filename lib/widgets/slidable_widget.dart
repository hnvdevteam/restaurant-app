import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:monkey_app_demo/const/colors.dart';

// enum SlidableAction { archive, share, more, delete }

class SlidableWidget<T> extends StatelessWidget {
  final Widget child;
  // final Function(SlidableAction action) onDismissed;

  const SlidableWidget({
    @required this.child,
    // @required this.onDismissed,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
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
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Slidable(
            actionPane: SlidableDrawerActionPane(),
            child: child,

            ///left side
            actions: <Widget>[
              IconSlideAction(
                caption: 'Action',
                color: Colors.blueAccent,
                icon: Icons.add_business,
                onTap: () {},
              ),
            ],

            /// right side
            secondaryActions: <Widget>[
              IconSlideAction(
                caption: 'More',
                color: Colors.black45,
                icon: Icons.more_horiz,
                onTap: () {},
              ),
              IconSlideAction(
                caption: 'Delete',
                color: Colors.red,
                icon: Icons.delete,
                onTap: () {},
              ),
            ],
          ),
        ),
      );
}
