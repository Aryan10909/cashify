import 'package:cashify/models/product.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  final List<Product> _shop = [
    Product(
      name: 'Product 1',
      price: 1599,
      description: "description",
      imagePath: 'assets/pexels-mat-brown-1034063.jpg',
    ),
    Product(
        name: 'Product 2',
        price: 99,
        description: "description",
        imagePath: 'assets/pexels-pixabay-47856.jpg'),
    Product(
        name: 'Product 3',
        price: 4599,
        description: "description",
        imagePath: "assets/pexels-pixabay-280250.jpg"),
    Product(
        name: 'Product 4',
        price: 799,
        description: "description",
        imagePath: "assets/pexels-valentin-antonucci-691640.jpg"),
  ];
  List<Product> _cart = [];
  List<Product> get shop => _shop;
  List<Product> get cart => _cart;

  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
