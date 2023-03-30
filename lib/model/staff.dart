// UserAccount
class StaffAccount {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String displayName;
  final String gender;
  final DateTime createTime;
  // final List<RestaurantInfo> restaurants; // query by RestaurantStaff.staffId = this.id

  StaffAccount(this.id, this.email, this.firstName, this.lastName,
      this.displayName, this.gender, this.createTime);
}

class RestaurantStaff {
  final String id;
  final String staffId;
  final String restaurantId;
  final StaffRole staffRole;
  final DateTime createTime;
  final int status; // -1: Refused, 0: Inviting, 1: Accepted

  RestaurantStaff(this.id, this.staffId, this.restaurantId, this.staffRole,
      this.createTime, this.status);
}

enum StaffRole { OWNER, MANAGER, CASHIER, CHEF, WAITER }
