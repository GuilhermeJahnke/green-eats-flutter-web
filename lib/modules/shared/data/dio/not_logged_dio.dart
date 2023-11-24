import 'package:dio/dio.dart';

import '../../domain/usecases/set_cookie_usecase.dart';
import '../interceptors/mock_interceptor.dart';
import '../interceptors/not_logged_interceptor.dart';
import 'base_dio.dart';

class NotLoggedDio extends BaseDio {
  NotLoggedDio({
    required super.environment,
    required SetCookieUsecase setCookieUsecase,
    List<Interceptor>? customInterceptorsImpl,
  }) : super(
          customInterceptors: [
            environment.isMock
                ? const MockInterceptor()
                : NotLoggedInterceptor(
                    setCookieUsecase: setCookieUsecase,
                  ),
            if (customInterceptorsImpl != null) ...customInterceptorsImpl,
          ],
        );
}
