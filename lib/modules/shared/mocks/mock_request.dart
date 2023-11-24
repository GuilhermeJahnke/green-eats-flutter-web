enum MockRequestType { get, post, put, delete, patch }

abstract class MockRequest {
  String get url;
  int get statusCode;
  MockRequestType get method;
  dynamic get body;
  dynamic get response;
}
