import 'package:agents_attendance/app/config/app_text_styles.dart';
import 'package:agents_attendance/domain/entities/shop.dart';
import 'package:flutter/material.dart';

// to capitalized for character
extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
}

class ShopItem extends StatelessWidget {
  const ShopItem({Key? key, required this.shop}) : super(key: key);

  final Shop shop;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              shop.name.toString().toCapitalized(),
              style: AppTextStyles.title,
            ),
            const SizedBox(height: 10),
            Text(
              shop.address.toString(),
              style: AppTextStyles.body,
            ),
          ],
        ),
      ),
    );
  }
}
