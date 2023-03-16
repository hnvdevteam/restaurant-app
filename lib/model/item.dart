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

class table_Item {
  final String id;
  final String total;
  final String reserved;

  const table_Item({
    @required this.id,
    @required this.total,
    @required this.reserved,
  });
}
