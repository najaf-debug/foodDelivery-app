import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/models/cart_item.dart';
import 'package:grocery_app/models/food.dart';
import 'package:intl/intl.dart';

class Restraunt extends ChangeNotifier {
  // List of food menu
  final List<Food> _menu = [
    // burgers
    Food(
        name: "Cheese Beef Burger",
        description:
            "Juicy cheese beef burger with melted chedder, lettuce, tomatoe, and a hint of onion and pickle",
        imagePath: "assets/images/burgers/cheese_burger_1.png",
        price: 1.19,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(
            name: "Extra Cheese",
            price: 0.55,
          ),
          Addon(
            name: "Bacon",
            price: 0.56,
          ),
          Addon(
            name: "Avocado",
            price: 0.99,
          ),
        ]),
    Food(
        name: "Double Beef Burger",
        description:
            "Juicy Double beef burger with melted chedder, lettuce, tomatoe",
        imagePath: "assets/images/burgers/cheese_burger_2.png",
        price: 2.33,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(
            name: "Extra Cheese",
            price: 0.55,
          ),
          Addon(
            name: "Extra sauce",
            price: 0.56,
          ),
          Addon(
            name: "Jalapenos",
            price: 0.99,
          ),
        ]),
    Food(
        name: "Cheese Beef Sliced Burger",
        description:
            "Juicy cheese beef Sliced burger with melted chedder, lettuce, tomatoe, and a hint of onion and pickle",
        imagePath: "assets/images/burgers/cheese_burger_3.png",
        price: 2.99,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(
            name: "Extra Cheese",
            price: 0.55,
          ),
          Addon(
            name: "Extra BBQ sauce",
            price: 0.56,
          ),
          Addon(
            name: "Avocado",
            price: 0.99,
          ),
        ]),

    // salads
    Food(
        name: "Fresh veggie salad plate",
        description:
            "Mixture of cucumber, tomatoe, lettuce and many other freshly harvested",
        imagePath: "assets/images/salads/salad_1.png",
        price: 0.99,
        category: FoodCategory.salads,
        availableAddons: [
          Addon(
            name: "Extra Toppings",
            price: 0.55,
          ),
        ]),
    Food(
        name: "Beef sushi",
        description: "Beef Sushi with melted chedder, lettuce, tomatoe",
        imagePath: "assets/images/salads/salad_2.png",
        price: 2.22,
        category: FoodCategory.salads,
        availableAddons: [
          Addon(
            name: "Extra Beef",
            price: 0.99,
          ),
        ]),
    Food(
        name: "Juicy Steak Salad",
        description:
            "Juicy Steak Salad With cabbage,Green Chillies, lettuce, tomatoe And Butter",
        imagePath: "assets/images/salads/salad_3.png",
        price: 3.99,
        category: FoodCategory.salads,
        availableAddons: [
          Addon(
            name: "Extra chillies",
            price: 0.55,
          ),
          Addon(
            name: "Avocados",
            price: 1.99,
          ),
        ]),

    // deserts
    Food(
        name: "Fruit Salad",
        description:
            "healthy fruit creamy salad containing fresh bananas, berries, strawberries and oats",
        imagePath: "assets/images/deserts/deserts_1.png",
        price: 2.00,
        category: FoodCategory.deserts,
        availableAddons: [
          Addon(
            name: "Cashews",
            price: 0.88,
          ),
        ]),
    Food(
        name: "Honey Covered PanCakes",
        description:
            "healthy bread with honey layer strawberry and black berries on top",
        imagePath: "assets/images/deserts/deserts_2.png",
        price: 3.99,
        category: FoodCategory.deserts,
        availableAddons: [
          Addon(
            name: "Oats",
            price: 0.49,
          ),
        ]),
    Food(
        name: "Honey Lemon Carved PanCakes",
        description:
            "healthy bread with honey layer with berries and lemon on top",
        imagePath: "assets/images/deserts/deserts_3.png",
        price: 1.40,
        category: FoodCategory.deserts,
        availableAddons: [
          Addon(
            name: "honey",
            price: 0.10,
          ),
        ]),

    // drinks
    Food(
        name: "Three Flavors Mint Cocktails",
        description: "chilled orange, berries and lemon margarita",
        imagePath: "assets/images/drinks/drink_1.png",
        price: 1.00,
        category: FoodCategory.beverages,
        availableAddons: [
          Addon(
            name: "Mint",
            price: 0.5,
          ),
        ]),
    Food(
        name: "Soft Drinks",
        description: "coca cola, sprite and fanta chilled cans",
        imagePath: "assets/images/drinks/drink_2.png",
        price: 2.99,
        category: FoodCategory.beverages,
        availableAddons: [
          Addon(
            name: "Extra Chilled",
            price: 0.10,
          ),
        ]),
    Food(
        name: "Pepsi with 1 coke free",
        description: "Get 1 Pepsi chilled can with 1 coke free",
        imagePath: "assets/images/drinks/drink_3.png",
        price: 2.05,
        category: FoodCategory.beverages,
        availableAddons: [
          Addon(
            name: "Extra Chilled",
            price: 0.10,
          ),
        ]),

    //sides
    Food(
        name: "Simple fries with ketchup",
        description: "crispy fries with ketchep",
        imagePath: "assets/images/appetizers/fries_1.png",
        price: 1.50,
        category: FoodCategory.appetizers,
        availableAddons: [
          Addon(
            name: "Pizza sauce",
            price: 0.55,
          ),
        ]),
    Food(
        name: "Crispy chicken spicy hot wings",
        description: "Crispy chicken hot wings with extra sauce",
        imagePath: "assets/images/appetizers/hot_wings.png",
        price: 2.95,
        category: FoodCategory.appetizers,
        availableAddons: [
          Addon(
            name: "Garlic sauce",
            price: 0.55,
          ),
        ]),
    Food(
        name: "Crispy Fries Large Plate",
        description: "crispy fries with ketchep and sauce",
        imagePath: "assets/images/appetizers/fries_3.png",
        price: 2.05,
        category: FoodCategory.appetizers,
        availableAddons: [
          Addon(
            name: "Extra sauce",
            price: 0.99,
          ),
        ]),
  ];

  // user cart
  final List<CartItem> _cart = [];

  // delivery address(which user can manually edit)
  String _deliveryAddress = 'Mohalla Qasabaan, House No:-C/1393';

  /*
  G E T T E R S
  */
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;

  /*
  O P E R A T I O N S
  */

  // add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    // see if there is a cart item already with the same food and selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      // check if the food items are the same
      bool isSameFood = item.food == food;

      // check if the list of selected addons are the same
      bool isSameAddons =
          ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
    });

    // if item already exists, just increase its quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }

    // otherwise, add a new cart item
    else {
      _cart.add(CartItem(food: food, selectedAddons: selectedAddons));
    }
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.remove(cartIndex);
      }
    }

    notifyListeners();
  }

  // get the total price in cart
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }

      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

  // get the total number of items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }

    return totalItemCount;
  }

  // clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

// update the delivery address
  void updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }

  /*
  H E L P E R S
  */

  // generate a receipt
  String displayCardReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt.");
    receipt.writeln();

    // format the date to include up to seconds only
    String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("----------");

    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.name} - ${cartItem.food.price}");
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln(" Add-one: ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }

    receipt.writeln("----------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln("Delivering to: $deliveryAddress");

    return receipt.toString();
  }

  // format double value into money
  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }

  // format list of address into a string summary
  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
        .join(", ");
  }
}
