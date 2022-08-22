import 'package:agents_attendance/domain/entities/shop.dart';
import 'package:agents_attendance/domain/usecases/fetch_shop_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/entities/paging.dart';

class ShopController extends GetxController {
  final FetchShopUseCase _fetchShopUseCase;

  ShopController(this._fetchShopUseCase);
  final scrollController = ScrollController();

  int _currentPage = 1;
  final _paging = Rx<Paging?>(null);

  var shops = RxList<Shop>([]);

  @override
  void onInit() {
    fetchData();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        _currentPage++;
        loadMore();
        update();
      }
    });

    super.onInit();
  }

  fetchData() async {
    _currentPage = 1;
    final newPaging = await _fetchShopUseCase.execute(_currentPage);
    shops.assignAll(newPaging.shopList);
    _paging.value = newPaging;
  }

  loadMore() async {
    final newPaging = await _fetchShopUseCase.execute(_currentPage);

    shops.addAll(newPaging.shopList);
    update();
  }
}
