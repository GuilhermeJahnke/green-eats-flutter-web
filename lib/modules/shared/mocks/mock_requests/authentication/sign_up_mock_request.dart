import '../../mock_maps/authentication/sign_up_mock_map.dart';
import '../../mock_request.dart';

class SignUpMockRequest extends MockRequest {
  @override
  Map<String, dynamic>? get body => SignUpMockMap.body;

  @override
  MockRequestType get method => MockRequestType.post;

  @override
  Map<String, dynamic>? get response => SignUpMockMap.response;

  @override
  int get statusCode => 200;

  @override
  String get url => '/auth/sign-up';
}
