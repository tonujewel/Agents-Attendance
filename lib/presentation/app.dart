import 'package:agents_attendance/presentation/controller/shop/shop_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/home_page/home_page.dart';


class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/",
      initialBinding: ShopBindings(),
      home: HomePage(),
    );
  }
}
