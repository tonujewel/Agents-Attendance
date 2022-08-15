abstract class AttendanceRepository {
  Future<dynamic> submitAttendance(
      String name, String uid, double lat, double lng, String reqId);
}
