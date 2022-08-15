
import 'package:agents_attendance/data/repository/attendance_repositoy_iml.dart';
import 'package:agents_attendance/domain/usecases/attendance_usercase.dart';
import 'package:get/get.dart';

import 'attendance_controller.dart';

class AttendanceBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AttendanceRepositoryIml(), permanent: true);
    Get.lazyPut(() => AttendanceUseCase(Get.find<AttendanceRepositoryIml>()));
    Get.put(AttendanceController(Get.find()), permanent: true);
  }
}
