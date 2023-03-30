class OrderSession {
  final String id;
  final DateTime openTime;
  final DateTime closeTime;
  final double itemAmount;
  final double itemDiscount;
  final double paymentAmount;
  final double paidAmount;
  final double refundAmount;
  final String description;
  final String tableId;
  final String restaurantId;
  // final List<OrderItem> orderItems; // query by OrderItem.orderId = this.id

  OrderSession(
      this.id,
      this.openTime,
      this.closeTime,
      this.itemAmount,
      this.itemDiscount,
      this.paymentAmount,
      this.paidAmount,
      this.refundAmount,
      this.description,
      this.tableId,
      this.restaurantId);
}

class OrderItem {
  final String id;
  final DateTime orderTime;
  final DateTime cancelTime;
  final DateTime cookingTime;
  final DateTime finishTime;
  final String description;
  final int status; // -1: Canceled, 0: Pending, 1: Cooking, 2: Finished
  final String itemId;
  final String orderId;
  final String chefId;
  final String restaurantId;
  // final FoodItem item; // query by FoodItem.id = this.itemId

  OrderItem(
      this.id,
      this.orderTime,
      this.cancelTime,
      this.cookingTime,
      this.finishTime,
      this.description,
      this.status,
      this.itemId,
      this.orderId,
      this.chefId,
      this.restaurantId);
}

enum OrderItemStatus { CANCELED, PENDING, COOKING, FINISHED }
