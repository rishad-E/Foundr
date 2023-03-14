import 'dart:developer';

import 'package:dio/dio.dart';

class AuthInterceptor extends InterceptorsWrapper {
  final String authToken;

  AuthInterceptor(this.authToken);

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // log(authToken, name: "auth");
    log('Request method: ${options.method}', name: "request");
    log('Request path: ${options.path}');
    log('Request headers: ${options.headers}');
    log('Request data: ${options.data}', name: "request");
    options.headers['Authorization'] = 'Bearer $authToken';
    options.headers['Content-Type'] = 'application/json';
    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    log('Response status code: ${response.statusCode}', name: "response");
    log('Response headers: ${response.headers}');
    log('Response data: ${response.data}', name: "response");
    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    log('Error message: ${err.message}', name: 'error');
    log('Error status code: ${err.response?.statusCode}');
    log('Error response data: ${err.response?.data}');
    return super.onError(err, handler);
  }
}
