import 'mock_request.dart';
import 'mock_requests/authentication/sign_in_mock_request.dart';
import 'mock_requests/authentication/sign_up_mock_request.dart';
import 'mock_requests/orders/get_all_orders_mock_request.dart';
import 'mock_requests/orders/send_order_mock_request.dart';
import 'mock_requests/profile/update_profile_mock_request.dart';
import 'mock_requests/shared/get_category_mock_request.dart';
import 'mock_requests/shared/get_products_mock_request.dart';

class MockManager {
  MockManager();

  final Map<({String path, MockRequestType requestType}), MockRequest> mocks = {
    (path: '/auth/sign-in', requestType: MockRequestType.post):
        SignInMockRequest(),
    (path: '/auth/sign-up', requestType: MockRequestType.post):
        SignUpMockRequest(),
    (path: '/categories', requestType: MockRequestType.get):
        GetCategoryMockRequest(),
    (path: '/products', requestType: MockRequestType.get):
        GetProductsMockRequest(),
    (path: '/users/', requestType: MockRequestType.patch):
        UpdateProfileMockRequest(),
    (path: '/orders', requestType: MockRequestType.get):
        GetAllOrdersMockRequest(),
    (path: '/orders', requestType: MockRequestType.post):
        SendOrderMockRequest(),
  };

  MockRequest? getMock({
    required String path,
    required MockRequestType requestType,
  }) {
    if (path.contains('users/')) {
      path = '/users/';
    }

    if (mocks.containsKey((path: path, requestType: requestType))) {
      return mocks[(path: path, requestType: requestType)];
    }

    throw Exception('Mock not found for url: $path');
  }
}
