// food item

class Food {
  final String name; // cheese burger
  final String description; // a burger full of cheese
  final String imagePath; // assets/images/cheese_burger.png
  final double price; // $3.19
  final FoodCategory category; // Fast food
  List<Addon> availableAddons; // [Extra Cheese and sauce]

  Food(
      {required this.name,
      required this.description,
      required this.imagePath,
      required this.price,
      required this.category,
      required this.availableAddons});
}

// food categories
enum FoodCategory {
  burgers,
  salads,
  appetizers,
  deserts,
  beverages,
}

// food addons
class Addon {
  String name;
  double price;

  Addon({required this.name, required this.price});
}
