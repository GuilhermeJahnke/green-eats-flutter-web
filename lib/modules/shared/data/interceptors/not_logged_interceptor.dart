import 'package:dio/dio.dart';

import '../../domain/usecases/set_cookie_usecase.dart';

class NotLoggedInterceptor implements Interceptor {
  const NotLoggedInterceptor({
    required this.setCookieUsecase,
  });

  final SetCookieUsecase setCookieUsecase;

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final cookie = response.headers.map['set-cookie']?.first;

    if (cookie != null) {
      setCookieUsecase.setCookie(cookie);
    }

    return handler.next(response);
  }
}
