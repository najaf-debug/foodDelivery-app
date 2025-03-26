import 'package:flutter/material.dart';
import 'package:grocery_app/components/my_button.dart';
import 'package:grocery_app/models/food.dart';
import 'package:grocery_app/models/restraunt.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddons = {};
  FoodPage({super.key, required this.food}) {
    // initialize selected addons to false
    for (Addon addon in food.availableAddons) {
      selectedAddons[addon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  // method to add to cart
  void addToCart(Food food, Map<Addon, bool> selectedAddons) {
    // close the current food page to go back to the menu
    Navigator.pop(context);

    // format the selected addons
    List<Addon> currentlySelectedAddons = [];
    for (Addon addon in widget.food.availableAddons) {
      if (widget.selectedAddons[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }

    // add to cart
    context.read<Restraunt>().addToCart(food, currentlySelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Scaffold UI
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // food image that we have selected
                Image.asset(widget.food.imagePath),

                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // food name
                      Text(
                        widget.food.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      // food price
                      Text(
                        '\$${widget.food.price}',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 16),
                      ),
                      SizedBox(
                        height: 18,
                      ),

                      // food description
                      Text(
                        widget.food.description,
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      Divider(
                        color: Theme.of(context).colorScheme.secondary,
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      // addons
                      Text(
                        "Add-ons",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).colorScheme.secondary),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: widget.food.availableAddons.length,
                          itemBuilder: (context, index) {
                            // get invidual addon
                            Addon addon = widget.food.availableAddons[index];

                            // return check Box UI
                            return CheckboxListTile(
                                title: Text(addon.name),
                                subtitle: Text(
                                  '\$${addon.price}',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                ),
                                value: widget.selectedAddons[addon],
                                onChanged: (bool? value) {
                                  setState(() {
                                    widget.selectedAddons[addon] = value!;
                                  });
                                });
                          },
                        ),
                      )
                    ],
                  ),
                ),

                // button -> add to cart
                MyButton(
                    onTap: () => addToCart(widget.food, widget.selectedAddons),
                    text: "Add To Cart"),

                SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),

        // back button
        SafeArea(
          child: Opacity(
            opacity: 0.7,
            child: Container(
              margin: EdgeInsets.only(left: 25),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios_rounded),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        )
      ],
    );
  }
}
