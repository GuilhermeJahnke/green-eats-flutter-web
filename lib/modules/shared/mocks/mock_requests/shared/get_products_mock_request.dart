import '../../mock_maps/shared/get_products_mock_request_map.dart';
import '../../mock_request.dart';

class GetProductsMockRequest extends MockRequest {
  @override
  dynamic get body => GetProductsMockMap.body;

  @override
  MockRequestType get method => MockRequestType.get;

  @override
  dynamic get response => GetProductsMockMap.response;

  @override
  int get statusCode => 200;

  @override
  String get url => '/products';
}
