// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:agents_attendance/domain/usecases/fetch_shop_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'repositories/mock_shop_repository.dart';

void main() {
  test("fetch shop list test", () async {
    const currentPage = 1;
    final fetchHeadlineUseCase = FetchShopUseCase(MockShopRepository());
    final paging = await fetchHeadlineUseCase.execute(currentPage);
        // Verify that data has created.
    expect(paging.shopList.length, 10);
  });
}
