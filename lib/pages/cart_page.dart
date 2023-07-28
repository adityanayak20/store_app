import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:store_app/service/api_service.dart';
import 'package:store_app/widgets/CartCard.dart';
import 'package:store_app/widgets/CartDetailsPage.dart';

class CartsPage extends StatelessWidget {
  const CartsPage({super.key});

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
    future: apiService.getCarts(),
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
        final dynamic carts = response["carts"];
        return _carts(context, carts);
      } else {
        return const Center(
          child: Text('No data available.'),
        );
      }
    },
  );
}

Widget _carts(BuildContext context, dynamic carts) {
  // Add the context parameter
  return ListView.builder(
    itemCount: carts.length,
    itemBuilder: (context, index) {
      final cart = carts[index];
      return GestureDetector(
        // Wrap each cartCard with GestureDetector
        onTap: () {
          // Navigate to the details page when tapped.
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartDetailsPage(
                id: cart["id"],
                total: cart["total"],
                totalProducts: cart["totalProducts"],
                userId: cart["userId"],
                products: cart["products"],
                discountedTotal: cart["discountedTotal"],
                totalQuantity: cart["totalQuantity"],
              ),
            ),
          );
        },
        child: CartCard(
          id: cart["id"],
          total: cart["total"],
          totalProducts: cart["totalProducts"],
          userId: cart["userId"],
        ),
      );
    },
  );
}
