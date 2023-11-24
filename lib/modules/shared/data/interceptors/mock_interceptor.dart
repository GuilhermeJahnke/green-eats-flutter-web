import 'package:dio/dio.dart';

import '../../../main/submodules/orders/presentation/entities/string_extension.dart';
import '../../mocks/mock_manager.dart';
import '../../mocks/mock_request.dart';

class MockInterceptor implements Interceptor {
  const MockInterceptor();

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final MockRequest? mock = MockManager().getMock(
      path: options.path,
      requestType: options.method.httpMethod,
    );

    if (mock != null) {
      return handler.resolve(
        Response(
          requestOptions: RequestOptions(
            path: options.path,
            method: options.method,
          ),
          data: mock.response,
          statusCode: mock.statusCode,
        ),
      );
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }
}
