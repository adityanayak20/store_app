import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String description;
  final double price;
  final double discountPercentage;
  final String thumbnail;
  final double discountedPrice;

  ProductCard({
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.thumbnail,
  }) : discountedPrice = calculateDiscountedPrice(
          price: price,
          discountPercentage: discountPercentage,
        );

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
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(thumbnail),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              description,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: '\$${discountedPrice.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 24, // Larger font size for discounted price
                      fontWeight: FontWeight.bold,
                      color: Colors.green[800], // Darker green color
                      fontFamily: 'Roboto', // Custom font (if desired)
                    ),
                    children: [
                      TextSpan(
                        text:
                            ' (${discountPercentage.toStringAsFixed(2)}% off)',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.red, // Discount percentage color
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  '\$${price.toStringAsFixed(2)}', // Format original price
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[600], // Lighter grey color
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

double calculateDiscountedPrice({
  required double price,
  required double discountPercentage,
}) {
  double discountAmount = price * (discountPercentage / 100);
  double discountedPrice = price - discountAmount;
  return discountedPrice;
}
