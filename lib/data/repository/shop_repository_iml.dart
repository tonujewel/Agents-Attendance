import 'package:agents_attendance/data/provider/network/apis/shop_api.dart';
import 'package:agents_attendance/domain/entities/paging.dart';
import 'package:agents_attendance/domain/repositories/shop_repository.dart';

import '../model/paging_model.dart';

class ShopRepositoyIml extends ShopRepository {
  @override
  Future<Paging> fetchShop(int page) async {
    final response = await ShopApi.fetchHeadline(page).request();
    return PagingModel.fromJson(response);
  }
}
