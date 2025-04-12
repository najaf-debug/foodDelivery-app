import 'package:flutter/material.dart';
import 'package:grocery_app/components/my_current_location.dart';
import 'package:grocery_app/components/my_description_box.dart';
import 'package:grocery_app/components/my_drawer.dart';
import 'package:grocery_app/components/my_food_tile.dart';
import 'package:grocery_app/components/my_silver_app_bar.dart';
import 'package:grocery_app/components/my_tab_bar.dart';
import 'package:grocery_app/models/food.dart';
import 'package:grocery_app/models/restraunt.dart';
import 'package:grocery_app/pages/food_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  // Tab bar controller
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Sort and return a list of food items that belong to a specific category
  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  // Return list of foods in a given category
  List<Widget> getFoodInThiSCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      // Get category menu
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);
      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          // Get individual food
          final food = categoryMenu[index];

          // Return food tile UI
          return MyFoodTile(
            food: food,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FoodPage(food: food),
              ),
            ),
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Updated Background Color
      drawer: MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySilverAppBar(
            title: MyTabBar(tabController: _tabController),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Colors.brown, // Complementary divider color
                  thickness: 1.5,
                ),
                // My current location
                MyCurrentLocation(),

                // Description box
                MyDescriptionBox(),
              ],
            ),
          ),
        ],
        body: Consumer<Restraunt>(
          builder: (context, restraunt, child) => TabBarView(
            controller: _tabController,
            children: getFoodInThiSCategory(restraunt.menu),
          ),
        ),
      ),
    );
  }
}
