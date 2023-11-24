import '../../mock_maps/orders/get_all_orders_mock_map.dart';
import '../../mock_request.dart';

class GetAllOrdersMockRequest extends MockRequest {
  @override
  dynamic get body => GetAllOrdersMockMap.body;

  @override
  MockRequestType get method => MockRequestType.get;

  @override
  dynamic get response => GetAllOrdersMockMap.response;

  @override
  int get statusCode => 200;

  @override
  String get url => '/orders';
}
