import 'dart:io';
import 'dart:convert';

import 'package:app_client/urban_driver_api/models/models.dart';
import 'package:app_client/urban_driver_api/urban_driver_api.dart';
import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:crypto/crypto.dart';

import 'package:common/common.dart';
import 'package:app_client/config.dart';
import 'package:intl/intl.dart';

final _uri = Uri.https(
  Config.urbanDriverApiDomain,
  Config.urbanDriverApiBaseUrl,
);

final _options = BaseOptions(
  baseUrl: _uri.toString(),
  responseType: ResponseType.json,
  contentType: Headers.formUrlEncodedContentType,
);

class InvalidCode implements Exception {}

class EmailExist implements Exception {}

class UrbanDriverApiClient {
  UrbanDriverApiClient() {
    _client.interceptors.add(
      RetryInterceptor(
        dio: _client,
        logPrint: print,
        retryDelays: const [
          Duration(milliseconds: 500),
          Duration(milliseconds: 750),
          Duration(seconds: 1)
        ],
      ),
    );
  }

  final _client = Dio(_options);

  Future<String> login({
    required String email,
    required String password,
  }) async {
    try {
      final res = await _client.post<Map<String, dynamic>>("/login", data: {
        "login": email,
        "password": password,
      });
      final String? token = res.data?["token"];
      if (token == null) throw Unauthorized();
      return token;
    } on DioError catch (e) {
      throw e.toDomain();
    }
  }

  Future<void> signin(SignInRequest request) async {
    try {
      final res = await _client.post<Map<String, dynamic>>(
        "/doperson",
        data: request,
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
        ),
      );

      if (res.data?["status"] != "ok") throw "unexpected";
    } on DioError catch (e) {
      if (e.response?.statusCode == 409) {
        if (e.response?.data?["error"] == "email exists") throw EmailExist();
        if (e.response?.data?["error"] == 'code') throw InvalidCode();
      }
      throw e.toDomain();
    } catch (e) {
      rethrow;
    }
  }

  Future<String> sendSmsVerificationCode(
    String phoneNumber,
  ) async {
    final date = DateTime.now();
    final format = DateFormat("yyyy-MM-dd HH:mm:ss");
    final dateStr = format.format(date);
    final toBeHashed = utf8.encode("$dateStr${Config.smsSalt}$phoneNumber");
    final hash = sha256.convert(toBeHashed).toString();
    try {
      final res = await _client.post<Map<String, dynamic>>(
        "/smscode",
        data: {
          "mobile": phoneNumber, //phoneNumber,
          "datetime": dateStr,
          "hash": hash,
        },
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
        ),
      );
      if (res.data?["status"] != "ok") throw "Failed to send sms";
      return hash;
    } on DioError catch (e) {
      throw e.toDomain();
    }
  }
}
