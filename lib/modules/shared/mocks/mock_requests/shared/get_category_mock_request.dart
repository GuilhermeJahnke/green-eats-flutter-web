import '../../mock_maps/shared/get_category_mock_map.dart';
import '../../mock_request.dart';

class GetCategoryMockRequest extends MockRequest {
  @override
  dynamic get body => GetCategoryMockMap.body;

  @override
  MockRequestType get method => MockRequestType.get;

  @override
  dynamic get response => GetCategoryMockMap.response;

  @override
  int get statusCode => 200;

  @override
  String get url => '/categories';
}
