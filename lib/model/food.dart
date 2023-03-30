class FoodItem {
  final String id;
  final String name;
  final double price;
  final String size;
  final String description;
  final String categoryId;
  final String restaurantId;

  FoodItem(this.id, this.name, this.price, this.size, this.description,
      this.categoryId, this.restaurantId);
}

class FoodCategory {
  final String id;
  final String name;
  final String description;
  final String restaurantId;
  // final List<FoodItem> foodItems; // query by FoodItem.categoryId = this.id

  FoodCategory(this.id, this.name, this.description, this.restaurantId);
}
