import 'dart:io';

import 'package:dio/dio.dart';

Dio _createDioClientWithBaseOptions() => Dio(
      BaseOptions(
        contentType: ContentType.json.value,
        followRedirects: true,
        maxRedirects: 10,
        connectTimeout: const Duration(seconds: 30).inMilliseconds,
        receiveTimeout: const Duration(seconds: 30).inMilliseconds,
        sendTimeout: const Duration(seconds: 30).inMilliseconds,
      ),
    );

Interceptor createLogInterceptor() => LogInterceptor(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      logPrint: (Object object) => _log.info(object.toString()),
    );
