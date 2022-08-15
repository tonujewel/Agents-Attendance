import 'package:agents_attendance/data/provider/network/apis/attendance_api.dart';
import 'package:agents_attendance/domain/repositories/attendance_repository.dart';

class AttendanceRepositoryIml extends AttendanceRepository {
  @override
  Future<dynamic> submitAttendance(
      String name, String uid, double lat, double lng, String reqId) async {
    final response =
        await AttendanceApi.submitAttendance(name, uid, lat, lng, reqId)
            .request();
    return response;
  }
}
