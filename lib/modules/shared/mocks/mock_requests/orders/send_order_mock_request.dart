import '../../mock_maps/orders/send_order_mock_map.dart';
import '../../mock_request.dart';

class SendOrderMockRequest extends MockRequest {
  @override
  dynamic get body => SendOrderMockMap.body;

  @override
  MockRequestType get method => MockRequestType.post;

  @override
  dynamic get response => SendOrderMockMap.response;

  @override
  int get statusCode => 200;

  @override
  String get url => '/orders';
}
