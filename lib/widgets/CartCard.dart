import 'package:flutter/material.dart';
import 'package:store_app/app_theme.dart'; // Import the AppTheme class

class CartCard extends StatelessWidget {
  final int id;
  final int total;
  final int totalProducts;
  final int userId;

  CartCard({
    required this.id,
    required this.total,
    required this.totalProducts,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cart ID: $id',
              style: AppTheme.lightTheme.textTheme.titleLarge,
            ),
            Text(
              'User ID: $userId',
              style: AppTheme.lightTheme.textTheme.bodyLarge,
            ),
            Text(
              'Total Products: $totalProducts',
              style: AppTheme.lightTheme.textTheme.bodyLarge,
            ),
            Text(
              'Total: \$${total.toStringAsFixed(2)}',
              style: AppTheme.lightTheme.textTheme.bodyText1?.copyWith(
                color: Colors.deepOrange[500],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
