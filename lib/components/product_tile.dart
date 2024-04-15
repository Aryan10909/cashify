import 'package:cashify/models/Shop.dart';
import 'package:cashify/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyProductTile extends StatelessWidget {
  final Product product;

  const MyProductTile({super.key, required this.product});
  void addToCart(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text("Are u sure to add it to the cart??"),
              actions: [
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancel!"),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                    context.read<Shop>().addToCart(product);
                  },
                  child: Text("Yess!"),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(17),
      width: 250,
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(25)),
                padding: EdgeInsets.all(10),
                width: double.infinity,
                child: Image.asset(product.imagePath)),
          ),
          const SizedBox(height: 20),
          Text(
            product.name,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Text(product.description),
          const SizedBox(height: 50),
          Center(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(product.price.toStringAsFixed(2)),
                  Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(10)),
                      child: IconButton(
                          onPressed: () => addToCart(context),
                          icon: Icon(Icons.add)))
                ]),
          )
        ],
      ),
    );
  }
}
