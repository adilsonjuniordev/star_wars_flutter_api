import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';

import '../config/env/env.dart';

class CustomDio extends DioForNative {
  CustomDio()
      : super(BaseOptions(
          baseUrl: Env.i['backend_base_url'] ?? '',
          connectTimeout: 4000,
          receiveTimeout: 30000,
        )) {
    interceptors.add(LogInterceptor(requestBody: true, responseBody: true, requestHeader: true));
  }
}
