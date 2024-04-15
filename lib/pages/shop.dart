import 'package:cashify/components/my_drawer.dart';
import 'package:cashify/components/product_tile.dart';
import 'package:cashify/models/Shop.dart';
import 'package:cashify/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class shop extends StatelessWidget {
  const shop({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "Grab here!",
            style: TextStyle(color: Colors.black45),
          ),
          actions: [
            IconButton(
                onPressed: () => Navigator.pushNamed(context, '/cart_page'),
                icon: Icon(Icons.shopping_cart))
          ],
        ),
        drawer: MyDrawer(),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: ListView(
          children: [
            const SizedBox(height: 10),
            Center(
                child: Text(
              "Pick from our extravanza collection here!",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 20),
            )),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 500,
              child: ListView.builder(
                  itemCount: products.length,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(9),
                  itemBuilder: ((context, index) {
                    final product = products[index];
                    return MyProductTile(product: product);
                  })),
            ),
          ],
        ));
  }
}
