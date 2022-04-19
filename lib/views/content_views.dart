import 'package:flutter/material.dart';

class SplashContent extends StatelessWidget {
  final String brand;
  final String color;

  const SplashContent({
    Key? key,
    required this.brand,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(brand),
          const SizedBox(width: 24),
          Text(color),
          const SizedBox(width: 24),
        ],
      ),
    );
  }
}
