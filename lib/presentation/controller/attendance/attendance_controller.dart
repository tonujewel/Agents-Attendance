import 'package:agents_attendance/app/config/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/usecases/attendance_usercase.dart';

class AttendanceController extends GetxController {
  final AttendanceUseCase _attendanceUseCase;
  AttendanceController(this._attendanceUseCase);
  LocationData? currentLocation;
  SharedPreferences? prefs;

  var nameTextField = TextEditingController();
  var userIdTextField = TextEditingController();
  @override
  void onInit() async {
    super.onInit();

    getCurrentLocation();
  }

  void generatealphaNumericId() async {
    final prefs = await SharedPreferences.getInstance();

    var prev = prefs.getString("prevId");
    prev ??= "JW00001";
    String data = prev.replaceAll("JW", "");
    int num = int.parse(data);
    num = num + 1;
    String nextId = getNumberFormar(num);
    prefs.setString("prevId", nextId);
    submitAttendanceAction(nextId);
  }

  String getNumberFormar(int number) {
    String numberData = "JW";

    if (number >= 1 && number <= 9) {
      numberData = "${numberData}0000$number";
    } else if (number >= 10 && number <= 99) {
      numberData = "${numberData}000$number";
    } else if (number >= 100 && number <= 999) {
      numberData = "${numberData}00$number";
    } else if (number >= 1000 && number <= 9999) {
      numberData = "${numberData}0$number";
    } else if (number >= 10000 && number <= 99999) {
      numberData = "$numberData" "$number";
    }

    return numberData;
  }

  void validation() {
    if (nameTextField.text.isEmpty) {
      AppConstant.errorSnackbar("Name required");
      return;
    }

    if (userIdTextField.text.isEmpty) {
      AppConstant.errorSnackbar("User Id required");
      return;
    }
    generatealphaNumericId();
  }

  void getCurrentLocation() async {
    update();
    Location location = Location();

    location.getLocation().then((location) {
      currentLocation = location;
      update();
    });

    update();
  }

  void submitAttendanceAction(String reqId) async {
    try {
      final response = await _attendanceUseCase.execute(
          nameTextField.text,
          userIdTextField.text,
          currentLocation!.latitude!.toDouble(),
          currentLocation!.longitude!.toDouble(),
          reqId);
      if (response != null) {
        Get.back();
        AppConstant.successSnackbar("Attendance submitted");
      }
    } catch (error) {
      AppConstant.errorSnackbar(error.toString());
      print(error.toString());
    }
  }
}
