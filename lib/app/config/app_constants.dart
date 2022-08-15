import 'package:agents_attendance/app/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppConstant {
  static SnackbarController errorSnackbar(String msg) {
    return Get.snackbar('Error', msg,
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white);
  }

  static SnackbarController successSnackbar(String msg) {
    return Get.snackbar('Success', msg,
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppColors.primary,
        colorText: Colors.white);
  }
}
