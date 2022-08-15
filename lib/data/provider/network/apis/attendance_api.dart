import '../api_endpoint.dart';
import '../api_provider.dart';
import '../api_request_representable.dart';

class AttendanceApi implements APIRequestRepresentable {
  final String name, uid, requestId;
  final double lat, lng;

  AttendanceApi._({
    required this.name,
    required this.uid,
    required this.lat,
    required this.lng,
    required this.requestId,
  });

  AttendanceApi.submitAttendance(
      String name, String uid, double lat, double lng, requestId)
      : this._(
          name: name,
          uid: uid,
          lat: lat,
          lng: lng,
          requestId: requestId,
        );
  @override
  get body => {
        'name': name,
        'uid': uid,
        'latitude': "$lat",
        'longitude': "$lng",
        'request_id': requestId
      };

  @override
  String get endpoint => APIEndpoint.baseUrl;

  @override
  Map<String, String>? get headers => null;

  @override
  HTTPMethod get method => HTTPMethod.post;

  @override
  String get path => "/api/attendance";

  @override
  Map<String, String>? get query => null;

  @override
  Future request() {
    return APIProvider.instance.request(this);
  }

  @override
  String get url => endpoint + path;
}
