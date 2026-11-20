import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

abstract final class DioClient {
  static const String searchBaseUrl = 'https://search.rcsb.org';
  static const String dataBaseUrl = 'https://data.rcsb.org';

  static Dio create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: searchBaseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 20),
      ),
    );
    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(
          requestHeader: false,
          responseHeader: false,
          logPrint: (line) => debugPrint('[dio] $line'),
        ),
      );
    }
    return dio;
  }
}
