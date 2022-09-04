import 'dart:io';

import 'package:app_client/urban_driver_api/models/getme/passenger.dart';
import 'package:app_client/user/user_repository.dart';
import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:intl/intl.dart';

import 'package:app_client/config.dart';
import 'package:common/common.dart' as domain;
import 'package:app_client/urban_driver_api/urban_driver_api.dart';
import 'package:app_client/urban_driver_api/models/models.dart';
import 'package:flutter/material.dart';

final _uri = Uri.https(
  Config.urbanDriverApiDomain,
  Config.urbanDriverApiBaseUrl,
);

final _options = BaseOptions(
  baseUrl: _uri.toString(),
  responseType: ResponseType.json,
  contentType: Headers.formUrlEncodedContentType,
);

class UrbanDriverApiAuthClient {
  UrbanDriverApiAuthClient({
    required TokenProvider tokenProvider,
    required RefreshTokenCallback refreshToken,
    required this.onAuthFatalError,
  }) {
    _client.interceptors.addAll([
      AuthInterceptor(
        tokenProvider: tokenProvider,
        refreshToken: refreshToken,
      ),
      RetryInterceptor(
        dio: _client,
        logPrint: print,
        retryDelays: const [
          Duration(milliseconds: 500),
          Duration(milliseconds: 750),
          Duration(seconds: 1)
        ],
      ),
    ]);
  }

  final _client = Dio(_options);
  final VoidCallback onAuthFatalError;

  /// Exceptions:
  /// - BadRequest
  /// - Unauthorized
  /// - Unexpected
  Future<Getme> getme() async {
    try {
      final response = await _client.get<Map<String, dynamic>>("/getme");
      return Getme.fromJson(response.data!);
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// Exceptions:
  /// - BadRequest
  /// - Unauthorized
  /// - Unexpected
  Future<GetWhere> getwhere(String input) async {
    try {
      final response = await _client.get<Map<String, dynamic>>(
        "/getwhere",
        queryParameters: {"search": input},
      );
      return GetWhere.fromJson(response.data!);
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// Exceptions:
  /// - BadRequest
  /// - Unauthorized
  /// - Unexpected
  Future<domain.ReservationEstimate> setTrip({
    required int userID,
    required domain.ReservationRequest request,
  }) async {
    try {
      final setTripRequest = SetTripRequest.fromDomain(
        userID: userID,
        request: request,
      );
      final response = await _client.post<Map<String, dynamic>>(
        "/settrip",
        data: setTripRequest,
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
      );
      final result = SetTripResult.fromJson(response.data!);
      return result.toDomain;
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<ValidTripResult> validTrip(
    ValidTripRequest request,
  ) async {
    try {
      final response = await _client.post<Map<String, dynamic>>(
        "/validtrip",
        data: request,
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
      );
      final result = ValidTripResult.fromJson(response.data!);
      return result;
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<CancelTransaction> cancelTransaction(int transactionID) async {
    try {
      final response = await _client.post(
        "/canceltransaction",
        data: {
          "transaction_id": transactionID,
        },
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
      );
      return CancelTransaction.fromJson(response.data!);
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<void> updateComment(
    int transactionID,
    String comment,
  ) async {
    try {
      final response = await _client.post(
        "/updatemessage",
        data: {
          "transaction_id": transactionID,
          "message": comment,
        },
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
      );
      if (response.data["status"] != "ok") "request failed";
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<TransactionStatus> tripStatus(
    int transactionID,
  ) async {
    try {
      final response = await _client.post<Map<String, dynamic>>(
        "/transactionstatus",
        data: {
          "transaction_id": transactionID,
        },
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
      );
      final result = TransactionStatus.fromJson(response.data!);
      return result;
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// if form invalid throw InvalidPassenger
  Future<void> newPassenger(
    NewPassengerRequest request,
  ) async {
    try {
      final response = await _client.post<Map<String, dynamic>>(
        "/newPassenger",
        data: request,
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
      );
      if (response.statusCode != 200) throw InvalidPassenger();
      return;
    } on InvalidPassenger {
      rethrow;
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<void> passengerBatchReplace(
    PassengerBatchReplaceRequest batch,
  ) async {
    try {
      final response = await _client.post<Map<String, dynamic>>(
        "/passagers",
        data: batch.passengers,
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
      );
      if (response.data?["status"] != "ok") throw "Request failed";
      return;
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<void> flightData({
    required String flightNumber,
    required DateTime date,
  }) async {
    try {
      //2022-03-19
      final dateStr = DateFormat.yMMMd().format(DateTime.now());
      final response = await _client.post<Map<String, dynamic>>(
        "/flightstatus",
        data: {
          "flightnumber": flightNumber,
          "flightdate": dateStr,
        },
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
      );
      if (response.data?["status"] != "ok") throw "Request failed";
      return;
    } catch (e) {
      throw _handleError(e);
    }
  }

  Exception _handleError(dynamic e) {
    if (e is DioError) {
      if (e.response?.statusCode == 401) {
        onAuthFatalError();
      }
      return e.toDomain();
    } else {
      return domain.Unexpected(e);
    }
  }
}
