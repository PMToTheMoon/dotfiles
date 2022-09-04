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

Interceptor sourceInterceptor() => InterceptorsWrapper(
      onRequest: (options, handler) async {
        options.headers['Source'] = 'MOBILE';
        final token = await tokenProvider();
        if (token != null && token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer:$token';
        }
        return handler.next(options);
      },
    );
