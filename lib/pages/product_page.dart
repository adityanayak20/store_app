import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:store_app/service/api_service.dart';
import 'package:store_app/widgets/ProductCard.dart';
import 'package:store_app/widgets/ProductDetailsPage.dart'; // Assuming you created the ProductDetailsPage widget in a separate file.

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }
}

FutureBuilder _body() {
  final apiService =
      ApiService(Dio(BaseOptions(contentType: 'application/json')));
  return FutureBuilder(
    future: apiService.getProducts(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (snapshot.hasError) {
        return Center(
          child: Text('Error: ${snapshot.error}'),
        );
      } else if (snapshot.hasData) {
        final dynamic response = snapshot.data!;
        final dynamic products = response["products"];
        return _products(context, products); // Pass the context to _products
      } else {
        return const Center(
          child: Text('No data available.'),
        );
      }
    },
  );
}

Widget _products(BuildContext context, dynamic products) {
  // Add the context parameter
  return ListView.builder(
    itemCount: products.length,
    itemBuilder: (context, index) {
      final product = products[index];
      return GestureDetector(
        // Wrap each ProductCard with GestureDetector
        onTap: () {
          // Navigate to the details page when tapped.
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailsPage(
                title: product["title"],
                description: product["description"],
                price: product["price"],
                discountPercentage: product["discountPercentage"],
                thumbnail: product["thumbnail"],
                images: product["images"],
              ),
            ),
          );
        },
        child: ProductCard(
          title: product["title"],
          description: product["description"],
          price: product["price"],
          discountPercentage: product["discountPercentage"],
          thumbnail: product["thumbnail"],
        ),
      );
    },
  );
}
