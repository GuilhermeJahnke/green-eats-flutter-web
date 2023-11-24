import '../../mock_maps/authentication/sign_in_mock_map.dart';
import '../../mock_request.dart';

class SignInMockRequest extends MockRequest {
  @override
  Map<String, dynamic>? get body => SignInMockMap.body;

  @override
  MockRequestType get method => MockRequestType.post;

  @override
  Map<String, dynamic>? get response => SignInMockMap.response;

  @override
  int get statusCode => 200;

  @override
  String get url => '/auth/sign-in';
}
