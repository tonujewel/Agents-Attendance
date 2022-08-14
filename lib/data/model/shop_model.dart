import 'package:agents_attendance/domain/entities/shop.dart';
import 'package:json_annotation/json_annotation.dart';
part 'shop_model.g.dart';

@JsonSerializable()
class ShopModel extends Shop {
  ShopModel(
    this.id,
    this.name,
    this.address,
  ) : super(id: id, name: name, address: address);

  int id;
  String name;
  String address;

  factory ShopModel.fromJson(Map<String, dynamic> json) =>
      _$ShopModelFromJson(json);
  Map<String, dynamic> toJson() => _$ShopModelToJson(this);
}
