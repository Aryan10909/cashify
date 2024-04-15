import 'package:cashify/components/my_button.dart';
import 'package:cashify/components/my_drawer.dart';
import 'package:cashify/models/Shop.dart';
import 'package:cashify/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text("Are u sure to remove it from the cart??"),
              actions: [
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancel!"),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                    context.read<Shop>().removeFromCart(product);
                  },
                  child: Text("Yess!"),
                ),
              ],
            ));
  }

  void payButtonPressed(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text("For paying, plz connect to payment gateway"),
            ));
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Cart collection!"),
      ),
      //drawer: MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Expanded(
              child: cart.isEmpty
                  ? Center(child: Text("Your cart is empty!"))
                  : ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        final item = cart[index];
                        return ListTile(
                          title: Text(item.name),
                          subtitle: Text(item.price.toStringAsFixed(2)),
                          trailing: IconButton(
                              onPressed: () =>
                                  removeItemFromCart(context, item),
                              icon: Icon(Icons.cancel)),
                        );
                      })),
          Padding(
            padding: EdgeInsets.all(50),
            child: MyButton(
                onTap: () => payButtonPressed(context),
                child: Text("Pay here!")),
          )
        ],
      ),
    );
  }
}
