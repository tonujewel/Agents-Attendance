import 'package:agents_attendance/domain/entities/shop.dart';
import 'package:agents_attendance/domain/usecases/fetch_shop_usecase.dart';
import 'package:get/get.dart';

import '../../../domain/entities/paging.dart';

class ShopController extends GetxController {
  final FetchShopUseCase _fetchShopUseCase;

  ShopController(this._fetchShopUseCase);

  int _currentPage = 1;
  var _isLoadMore = false;
  final _paging = Rx<Paging?>(null);

  var shops = RxList<Shop>([]);

  fetchData() async {
    _currentPage = 1;
    final newPaging = await _fetchShopUseCase.execute(_currentPage);
    shops.assignAll(newPaging.shopList);
    _paging.value = newPaging;
  }

  loadMore() async {
    if (!_isLoadMore) return;
    _isLoadMore = true;
    _currentPage += 1;
    final newPaging = await _fetchShopUseCase.execute(_currentPage);
    shops.addAll(newPaging.shopList);
  }
}
