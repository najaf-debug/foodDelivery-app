import 'package:flutter/material.dart';
import 'package:grocery_app/pages/cart_page.dart';

class MySilverAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;

  const MySilverAppBar({super.key, required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 340,
      collapsedHeight: 120,
      floating: false,
      pinned: true,
      actions: [
        // Cart button
        IconButton(
          onPressed: () {
            // Go to the cart page
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CartPage()));
          },
          icon: const Icon(Icons.shopping_cart,
              color: Colors.white), // Ensuring good contrast
        ),
      ],
      backgroundColor: Color(0xFF80CBC4), //  for contrast
      foregroundColor: Colors.white, // White for better readability
      title: const Text(
        'Sunset Diner',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white, // Text is more readable on dark background
        ),
      ),
      centerTitle: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: child,
        ),
        title: title,
        centerTitle: true,
        titlePadding: const EdgeInsets.only(left: 0, right: 0, top: 0),
        expandedTitleScale: 1,
      ),
    );
  }
}
