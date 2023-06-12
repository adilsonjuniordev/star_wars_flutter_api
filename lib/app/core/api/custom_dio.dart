import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import '../config/env/env.dart';

class CustomDio extends DioForNative {
  CustomDio([String? baseUrl])
      : super(BaseOptions(
          baseUrl: Env.i['backend_base_url'] ?? '',
          connectTimeout: const Duration(seconds: 4),
          receiveTimeout: const Duration(seconds: 30),
        )) {
    interceptors.add(LogInterceptor(requestBody: true, responseBody: true, requestHeader: true));
  }
}
