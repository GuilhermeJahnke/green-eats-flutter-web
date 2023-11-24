import 'package:dio/adapter_browser.dart';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter/cupertino.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../configs/env/environment.dart';

abstract class BaseDio extends DioForNative {
  BaseDio({
    List<Interceptor>? customInterceptors,
    required Environment environment,
  }) : super() {
    httpClientAdapter = BrowserHttpClientAdapter()..withCredentials = false;

    interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        maxWidth: 120,
        request: true,
        responseBody: true,
        logPrint: (obj) {
          debugPrint(obj as String?);
        },
      ),
    );

    if (customInterceptors?.isNotEmpty == true) {
      interceptors.addAll(customInterceptors!);
    }

    options = BaseOptions(
      baseUrl: environment.baseUrl,
      connectTimeout: 60000,
      receiveTimeout: 60000,
      sendTimeout: 60000,
    );
  }
}
