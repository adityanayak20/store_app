import 'package:flutter/material.dart';

class CartDetailsPage extends StatelessWidget {
  final int id;
  final int total;
  final int totalProducts;
  final int userId;
  final int totalQuantity;
  final int discountedTotal;
  final List<dynamic> products;

  CartDetailsPage({
    required this.id,
    required this.total,
    required this.totalProducts,
    required this.userId,
    required this.totalQuantity,
    required this.discountedTotal,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate the total cart price by summing up the total of all products
    final totalCartPrice = products
        .map<double>((product) => product["total"])
        .reduce((total, currentTotal) => total + currentTotal);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cart ID: $id',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              'User ID: $userId',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Total Products: $totalProducts',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Total Quantity: $totalQuantity',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Total: \$${total.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
            ),
            Text(
              'Discounted Total: \$${discountedTotal.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.green, // Use green color for discounted total
                  ),
            ),
            Divider(),
            Text(
              'Products in Cart:',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductCard(
                    title: product["title"],
                    price: product["price"],
                    quantity: product["quantity"],
                    total: product["total"],
                    discountPercentage: product["discountPercentage"],
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Total Cart Price: \$${totalCartPrice.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
                shadows: [
                  Shadow(
                    color: Colors.blueGrey,
                    offset: Offset(2, 2),
                    blurRadius: 5,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final int quantity;
  final double total;
  final double discountPercentage;

  ProductCard({
    required this.title,
    required this.price,
    required this.quantity,
    required this.total,
    required this.discountPercentage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Price: \$${price.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Quantity: $quantity',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Total: \$${total.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green[800],
              ),
            ),
            Text(
              'Discount: ${discountPercentage.toStringAsFixed(2)}%',
              style: TextStyle(
                fontSize: 16,
                color: Colors.red,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
