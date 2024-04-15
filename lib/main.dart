//import 'dart:js';

import 'package:cashify/models/Shop.dart';
import 'package:cashify/pages/cart_page.dart';
import 'package:cashify/pages/shop.dart';
import 'package:cashify/themes/light_mode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/intro_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Shop(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      theme: lightMode,
      routes: {
        '/intro_page': (context) => const IntroPage(),
        '/shop': (context) => const shop(),
        '/cart_page': (context) => const CartPage(),
      },
    );
  }
}
