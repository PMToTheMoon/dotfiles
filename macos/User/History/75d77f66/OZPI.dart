import 'dart:io';

import 'package:dio/dio.dart';

final _publicLog = Logger('ZanalysPublicApiClient');
final _privateLog = Logger('ZanalysPrivateApiClient');

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

Dio createDioPublicClient({
  required String baseUrl,
  required bool isDebug,
}) {
  final dio = createDioClientWithBaseOptions(baseUrl);
  dio.interceptors.add(
    sourceInterceptor(),
  );
  if (isDebug) {
    dio.interceptors.add(LogInterceptor(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      logPrint: (Object object) => _publicLog.info(object.toString()),
    ));
  }
  return dio;
}

Dio createDioPrivateClient({
  required bool isDebug,
  required String baseUrl,
  required BearerTokenProvider tokenProvider,
  required RefreshTokenCallback refreshTokenCallback,
}) {
  final dio = createDioClientWithBaseOptions(baseUrl);
  dio.interceptors.addAll([
    sourceInterceptor(),
    _refreshTokenInterceptor(
      dio,
      tokenProvider: tokenProvider,
      refreshTokenCallback: refreshTokenCallback,
    ),
    if (isDebug)
      LogInterceptor(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        logPrint: (Object object) => _privateLog.info(object.toString()),
      ),
  ]);
  return dio;
}

Interceptor _refreshTokenInterceptor(
  Dio baseClient, {
  required BearerTokenProvider tokenProvider,
  required RefreshTokenCallback refreshTokenCallback,
}) =>
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        String? token = await tokenProvider();
        if (token == null || token.isEmpty) {
          return handler.reject(
              DioError(
                  requestOptions: options,
                  response: Response(
                    requestOptions: options,
                    statusCode: 401,
                  )),
              true);
        }
        options.headers['Authorization'] = 'Bearer:$token';
        return handler.next(options);
      },
      onError: (error, handler) async {
        //Handle 401 HTTP ERRORS and refresh token
        if (error.response?.statusCode == 401 &&
            error.requestOptions.path != '/auth/refresh') {
          await refreshTokenCallback();
          final token = tokenProvider();
          if (token != null && token.isNotEmpty) {
            error.requestOptions.headers['Authorization'] = 'Bearer:$token';

            final opts = Options(
                method: error.requestOptions.method,
                headers: error.requestOptions.headers);

            // form data workaround
            dynamic data = error.requestOptions.data;
            if (data is FormData) {
              data = FormData.fromMap({}..addEntries(data.fields));
            }

            final cloneReq = await baseClient.request(error.requestOptions.path,
                options: opts,
                data: data,
                queryParameters: error.requestOptions.queryParameters);

            return handler.resolve(cloneReq);
          } else {
            handler.reject(error);
          }
        } else {}
        handler.next(error);
      },
    );
