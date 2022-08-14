import 'package:agents_attendance/data/repository/shop_repository_iml.dart';
import 'package:agents_attendance/domain/usecases/fetch_shop_usecase.dart';
import 'package:agents_attendance/presentation/controller/shop/shop_controller.dart';
import 'package:get/instance_manager.dart';

class ShopBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ShopRepositoyIml(), permanent: true);
    Get.lazyPut(() => FetchShopUseCase(Get.find<ShopRepositoyIml>()));
    Get.put(ShopController(Get.find()), permanent: true);
  }
}
