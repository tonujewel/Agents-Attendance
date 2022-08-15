import 'package:agents_attendance/domain/repositories/attendance_repository.dart';

class AttendanceUseCase {
  final AttendanceRepository _repo;
  AttendanceUseCase(this._repo);

  Future<dynamic> execute(
      String name, String uid, double lat, double lng, String reqId) {
    return _repo.submitAttendance(name, uid, lat, lng, reqId);
  }
}
