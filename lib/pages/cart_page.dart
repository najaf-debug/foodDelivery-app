import 'package:flutter/material.dart';
import 'package:grocery_app/components/my_button.dart';
import 'package:grocery_app/components/my_cart_tile.dart';
import 'package:grocery_app/models/restraunt.dart';
import 'package:grocery_app/pages/payment_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restraunt>(builder: (context, restraunt, child) {
      // cart
      final userCart = restraunt.cart;

      // scaffold
      return Scaffold(
        appBar: AppBar(
          title: Text("cart"),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            // clear cart button
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text(
                                "Are you sure you want to clear the cart?"),
                            actions: [
                              // cancel button
                              TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text("Cancel")),
                              // yes button
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    restraunt.clearCart();
                                  },
                                  child: Text("Yes")),
                            ],
                          ));
                },
                icon: Icon(Icons.delete))
          ],
        ),
        body: Column(
          children: [
            // list of
            Expanded(
              child: Column(
                children: [
                  userCart.isEmpty
                      ? Expanded(child: Center(child: Text("Cart is empty...")))
                      : Expanded(
                          child: ListView.builder(
                          itemCount: userCart.length,
                          itemBuilder: (context, index) {
                            // get individual cart item
                            final cartItem = userCart[index];

                            // return cart tile UI
                            return MyCartTile(cartItem: cartItem);
                          },
                        )),
                ],
              ),
            ),

            // button to pay
            MyButton(
                text: "Go to checkout",
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PaymentPage()))),

            SizedBox(
              height: 25,
            )
          ],
        ),
      );
    });
  }
}
