import 'dart:io';

import 'package:dio/dio.dart';

Dio createDioClientWithBaseOptions(String baseUrl) => Dio(
      BaseOptions(
        baseUrl: baseUrl,
        contentType: ContentType.json.value,
        followRedirects: true,
        maxRedirects: 10,
        connectTimeout: const Duration(seconds: 30).inMilliseconds,
        receiveTimeout: const Duration(seconds: 30).inMilliseconds,
        sendTimeout: const Duration(seconds: 30).inMilliseconds,
      ),
    );

/// Add a header 'Source == MOBILE' on request
///
/// This header is used by the server to maintain different auth
/// session for web and mobile
Interceptor sourceInterceptor() => InterceptorsWrapper(
      onRequest: (options, handler) async {
        options.headers['Source'] = 'MOBILE';
        return handler.next(options);
      },
    );
