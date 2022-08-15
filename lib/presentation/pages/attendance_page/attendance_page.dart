import 'package:agents_attendance/domain/entities/shop.dart';
import 'package:agents_attendance/presentation/controller/attendance/attendance_controller.dart';
import 'package:agents_attendance/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AttendancePage extends GetView<AttendanceController> {
  AttendancePage({Key? key, required this.shop}) : super(key: key);

  final Shop shop;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Attendance'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                label: "Name",
                controller: controller.nameTextField,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                label: "User id",
                controller: controller.userIdTextField,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 50),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50), // <-- Radius
                  ),
                ),
                onPressed: () {
                  controller.validation();
                },
                child: const Text("Submit"),
              )
            ],
          ),
        ),
      );
    });
  }
}
