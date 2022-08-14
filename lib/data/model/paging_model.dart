import 'package:agents_attendance/data/model/shop_model.dart';
import 'package:agents_attendance/domain/entities/paging.dart';
import 'package:agents_attendance/domain/entities/shop.dart';

class PagingModel extends Paging {
  PagingModel({
    required this.shopList,
  }) : super(shopList: shopList);

  final List<Shop> shopList;

  @override
  factory PagingModel.fromJson(Map<String, dynamic> json) => PagingModel(
        shopList: List.from(json["data"].map((x) => ShopModel.fromJson(x))),
      );
}
