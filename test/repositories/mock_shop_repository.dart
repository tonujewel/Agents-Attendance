import 'dart:convert';
import 'dart:io';
import 'package:agents_attendance/data/model/paging_model.dart';
import 'package:agents_attendance/domain/repositories/shop_repository.dart';

class MockShopRepository extends ShopRepository {
  @override
  Future<PagingModel> fetchShop(int page) async {
    final file = File("test/data/shop_list_sample.json");
    final response = await file.readAsString();
    final data = await json.decode(response);
    return PagingModel.fromJson(data);
  }
}
