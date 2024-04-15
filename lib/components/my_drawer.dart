import 'package:cashify/components/my_listtile.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          DrawerHeader(
              child: Center(
            child: Icon(
              Icons.shopping_basket_rounded,
              size: 60,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          )),
          const SizedBox(
            height: 10,
          ),
          MyListTile(
              text: "Purchase",
              icon: Icons.shop,
              onTap: () => Navigator.pop(context)),
          const SizedBox(
            height: 10,
          ),
          MyListTile(
              text: "Your cart",
              icon: Icons.shopping_cart,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/cart_page');
              }),
          const SizedBox(
            height: 10,
          ),
          MyListTile(
              text: "Exit",
              icon: Icons.exit_to_app,
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context, '/intro_page', (route) => false)),
        ],
      ),
    );
  }
}
