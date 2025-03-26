import 'package:flutter/material.dart';
import 'package:grocery_app/components/my_drawer_title.dart';
import 'package:grocery_app/pages/settings._page.dart';
import 'package:grocery_app/services/auth/auth_services.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // app logo
          Padding(
            padding: const EdgeInsets.only(
              top: 100.0,
            ),
            child: Icon(
              Icons.lock_open_rounded,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          // home list title
          MyDrawerTitle(
              text: "H O M E",
              icon: Icons.home,
              onTap: () => Navigator.pop(context)),

          // settings list title
          MyDrawerTitle(
              text: "S E T T I N G S",
              icon: Icons.settings,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()),
                );
              }),
          Spacer(),

          // logout list title
          MyDrawerTitle(
            text: "L O G O U T",
            icon: Icons.logout,
            onTap: logout,
          ),
        ],
      ),
    );
  }
}
