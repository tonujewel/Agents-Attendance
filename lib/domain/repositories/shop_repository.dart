import 'package:agents_attendance/domain/entities/paging.dart';

abstract class ShopRepository {
  Future<Paging> fetchShop(int page);
}
