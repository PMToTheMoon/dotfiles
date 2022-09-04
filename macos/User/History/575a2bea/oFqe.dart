import 'dart:io';

import 'package:dio/dio.dart';

Dio createDioClientWithBaseOptions() => Dio(
      BaseOptions(
        contentType: ContentType.json.value,
        followRedirects: true,
        maxRedirects: 10,
        connectTimeout: const Duration(seconds: 30).inMilliseconds,
        receiveTimeout: const Duration(seconds: 30).inMilliseconds,
        sendTimeout: const Duration(seconds: 30).inMilliseconds,
      ),
    );

/// Add a header 'Source == MOBILE' on request
Interceptor sourceInterceptor() => InterceptorsWrapper(
      onRequest: (options, handler) async {
        options.headers['Source'] = 'MOBILE';
        return handler.next(options);
      },
    );
