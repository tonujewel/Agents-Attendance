import 'package:agents_attendance/domain/repositories/shop_repository.dart';
import '../../app/core/usecase/pram_usecase.dart';
import '../entities/paging.dart';

class FetchShopUseCase extends ParamUseCase<Paging, int> {
  final ShopRepository _repo;
  FetchShopUseCase(this._repo);

  @override
  Future<Paging> execute(int params) {
    return _repo.fetchShop(params);
  }
}
