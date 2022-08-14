import 'package:agents_attendance/data/provider/network/api_endpoint.dart';
import 'package:agents_attendance/data/provider/network/api_provider.dart';
import 'package:agents_attendance/data/provider/network/api_request_representable.dart';

class ShopApi implements APIRequestRepresentable {
  final int pageNumber;

  ShopApi._({required this.pageNumber});

  ShopApi.fetchHeadline(int page) : this._(pageNumber: page);

  @override
  get body => null;

  @override
  String get endpoint => APIEndpoint.baseUrl;

  @override
  Map<String, String>? get headers => null;

  @override
  HTTPMethod get method => HTTPMethod.get;

  @override
  String get path => "/api/stores";

  @override
  Map<String, String>? get query => null;

  @override
  Future request() {
    return APIProvider.instance.request(this);
  }

  @override
  String get url => endpoint + path;
}
