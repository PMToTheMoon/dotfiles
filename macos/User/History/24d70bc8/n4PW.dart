import 'dart:async';

import 'package:dio/dio.dart';
import 'package:logging/logging.dart';

import '_dio.dart';

final _log = Logger('ZanalysPublicApiClient');

class ZanalysPublicApiClient {
  factory ZanalysPublicApiClient(String baseUrl, {bool isDebug = false}) {
    final dio = createDioPublicClient(
      baseUrl: baseUrl,
      isDebug: isDebug,
    );
    return ZanalysPublicApiClient._(baseUrl, dio);
  }

  final AuthenticationAPI _auth;

  Future<LogInStatus> logIn({
    required String identifier,
    required String password,
  }) async {
    String status = await _auth.logIn(identifier, password);
    return LogInMapper().convert(status);
  }

  Future<User?> folderSignIn(
      {required String identifier, required String password}) {
    return _auth.folderSignIn(identifier, password);
  }

  Future<Session?> validateOTP(
      {required String identifier,
      required String password,
      required String code}) {
    return _auth.validateOTP(identifier, password, code);
  }

  /// refresh bearer token using refreshToken
  Future<String?> refreshToken(String refreshToken) {
    return _auth.refreshToken(refreshToken);
  }

  ZanalysPublicApiClient._(String baseUrl, Dio dio)
      : _auth = AuthenticationAPI(dio, baseUrl: baseUrl);
}
