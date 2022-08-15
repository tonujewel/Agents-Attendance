import 'package:agents_attendance/presentation/controller/attendance/attendance_binding.dart';
import 'package:agents_attendance/presentation/controller/shop/shop_controller.dart';
import 'package:agents_attendance/presentation/pages/attendance_page/attendance_page.dart';
import 'package:agents_attendance/presentation/pages/home_page/shop_item.dart';
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
        _scrollController.addListener(() {
          _scrollListener();
        });
      },
      didUpdateWidget: (old, newState) {
        _scrollController.addListener(_scrollListener);
      },
      dispose: (state) {
        _scrollController.removeListener(_scrollListener);
      },
      builder: (_) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('Shop List'),
            ),
            body: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              controller: _scrollController,
              itemCount: controller.shops.length,
              itemBuilder: (context, index) {
                final shopData = controller.shops[index];
                return GestureDetector(
                  onTap: () {
                      AttendanceBindings().dependencies();
                    Get.to(() => AttendancePage(shop: shopData));
                  },
                  child: ShopItem(shop: shopData),
                );
              },
            ));
      },
    );
  }

  void _scrollListener() {
    if (_scrollController.position.extentAfter < 500) {
      controller.loadMore();
    }
  }
}
