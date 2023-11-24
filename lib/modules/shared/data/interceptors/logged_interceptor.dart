import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../domain/usecases/get_cookie_usecase.dart';
import '../../domain/usecases/set_cookie_usecase.dart';

class LoggedInterceptor implements Interceptor {
  LoggedInterceptor({
    this.onUnauthorized,
    required this.getCookieUsecase,
    required this.setCookieUsecase,
  });

  final VoidCallback? onUnauthorized;
  final GetCookieUsecase getCookieUsecase;
  final SetCookieUsecase setCookieUsecase;

  String? _cookie;

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.type == DioErrorType.response &&
        err.response?.statusCode == HttpStatus.unauthorized) {
      onUnauthorized?.call();
    }

    return handler.next(err);
  }

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    _cookie = await getCookieUsecase.getCookie();

    options.headers['Authorization'] = 'Bearer $_cookie';

    return handler.next(options);
  }

  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    final cookie = response.headers.map['set-cookie']?.first;

    if (cookie != null) {
      await setCookieUsecase.setCookie(cookie);
    }

    return handler.next(response);
  }
}
