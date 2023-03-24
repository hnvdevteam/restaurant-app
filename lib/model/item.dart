import 'package:meta/meta.dart';

class Item {
  final String url;
  final String name;
  final String info;

  const Item({
    @required this.url,
    @required this.name,
    @required this.info,
  });
}

class Table_Item {
  final String id;
  final String total;
  final String reservation;

  const Table_Item({
    @required this.id,
    @required this.total,
    @required this.reservation,
  });
}

class Order_Item {
  final String name;
  final String quantity;
  final String price;

  const Order_Item({
    @required this.name,
    @required this.quantity,
    @required this.price,
  });
}
