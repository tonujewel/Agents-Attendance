import 'package:agents_attendance/presentation/controller/shop/shop_controller.dart';
import 'package:agents_attendance/presentation/pages/home_page/shop_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<ShopController> {
  HomePage({Key? key}) : super(key: key);
  final _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return GetX(
      init: controller,
      initState: (state) {
        controller.fetchData();
      },
      didUpdateWidget: (old, newState) {
        _scrollController.addListener(_scrollListener);
      },
      dispose: (state) {
        _scrollController.removeListener(_scrollListener);
      },
      builder: (_) {
        return Scaffold(
          appBar: const CupertinoNavigationBar(
            middle: Text('Shop List'),
          ),
          body: ListView.builder(
            controller: _scrollController,
            itemCount: controller.shops.length,
            itemBuilder: (context, index) {
              final article = controller.shops[index];
              return GestureDetector(
                onTap: () {
                  //  Get.to(() => DetailPage(article: article));
                },
                child: ShopItem(shop: article),
              );
            },
          ),
        );
      },
    );
  }

  void _scrollListener() {
    if (_scrollController.position.extentAfter < 500) {
    
      controller.loadMore();
    }
  }
}
