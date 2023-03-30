class RestaurantInfo {
  final String id;
  final String name;
  final String address;
  final String phone;
  final String currency;
  final String packageId;
  // final PackageQuota package; // query by PackageQuota.id = this.packageId
  // final List<TableInfo> tables; // query by TableInfo.restaurantId = this.id
  // final List<StaffAccount> staffs; // query by RestaurantStaff.restaurantId = this.id

  RestaurantInfo(this.id, this.name, this.address, this.phone, this.currency,
      this.packageId);
}

class PackageQuota {
  final String id;
  final int staffs;
  final int tables;
  final DateTime expire;

  PackageQuota(this.id, this.staffs, this.tables, this.expire);
}

class TableInfo {
  final String id;
  final String name;
  final DateTime reserveTime;
  final DateTime reserveExpire;
  final String orderSessionId;
  final String restaurantId;
  // final OrderSession orderSession; // query by this.orderSessionId = OrderSession.id

  TableInfo(this.id, this.name, this.reserveTime, this.reserveExpire,
      this.orderSessionId, this.restaurantId);
}
