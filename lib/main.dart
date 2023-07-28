import 'package:flutter/material.dart';
import 'pages/product_page.dart';
import 'pages/cart_page.dart';
import 'app_theme.dart'; // Import the app_theme.dart file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme, // Use the dark theme from AppTheme
      home: TabViewScreen(),
    );
  }
}

class TabViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Product-Cart'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Products'),
              Tab(text: 'Cart'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ProductsPage(),
            CartsPage(),
          ],
        ),
      ),
    );
  }
}
