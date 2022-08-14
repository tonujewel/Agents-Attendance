import 'package:agents_attendance/domain/entities/shop.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ShopItem extends StatelessWidget {
  const ShopItem({Key? key, required this.shop}) : super(key: key);

  final Shop shop;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Text(
        "${shop.name} ${shop.id} ",
      ),
    );
  }
}
