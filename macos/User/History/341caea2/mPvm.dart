import 'dart:convert';

import 'package:app_client/auth/auth.dart';
import 'package:app_client/urban_driver_api/models/models.dart' as ud;
import 'package:app_client/user/user.dart';
import 'package:hive/hive.dart';

import 'package:common/common.dart';
import 'package:app_client/urban_driver_api/urban_driver_api.dart'
    as urban_driver;

const String _kReservationRepositoryKey = "reservation_repository_key";
const String _kReservationKey = "reservation_key";

class CancellationRefused implements DomainException {
  CancellationRefused(this.message);
  final String message;
}

class ReservationRepository {
  ReservationRepository({
    required AuthRepository authRepository,
    required this.userRepository,
  }) : _urbanDriver = urban_driver.UrbanDriverApiAuthClient(
          tokenProvider: authRepository.getToken,
          refreshToken: authRepository.refreshToken,
          onAuthFatalError: authRepository.logout,
        );

  final UserRepository userRepository;
  final urban_driver.UrbanDriverApiAuthClient _urbanDriver;

  Future<ReservationRepository> init() async {
    await Hive.openBox(_kReservationRepositoryKey);
    return this;
  }

  Future<ReservationEstimate> getReservationEstimate(
    int userID,
    ReservationRequest request,
  ) async {
    return _urbanDriver.setTrip(
      userID: userID,
      request: request,
    );
  }

  // cache validatedReservations
  Future<ValidatedReservation> validateReservation({
    required int userID,
    required EstimatedReservation reservation,
    String? comment,
  }) async {
    final result = await _urbanDriver.validTrip(
      ud.ValidTripRequest(
        userID: userID,
        paymentID: reservation.paymentMethod.id,
        proposalID: reservation.estimate.id,
        priceWithoutTaxes: reservation.estimate.priceWithoutTaxes.toString(),
        price: reservation.estimate.price.toString(),
        vat: reservation.estimate.vat.toString(),
        vatPercent: reservation.estimate.vatPercent.toString(),
        currency: reservation.estimate.currency,
        comment: comment,
      ),
    );

    final validatedReservation = reservation.validate(
      result.transactionID,
      comment: comment,
    );
    await _cache.put(_kReservationKey, jsonEncode(validatedReservation));
    return validatedReservation;
  }

  /// return [void]
  /// or throw [CancellationRefused]
  Future<void> cancelTransaction(
    int transactionID,
  ) async {
    final result = await _urbanDriver.cancelTransaction(transactionID);
    if (result is ud.CancelTransactionRefused) {
      throw CancellationRefused(result.message);
    }
    await userRepository.fetch();
  }

  Future<void> updateComment(
    int transactionID,
    String comment,
  ) async {
    try {
      await _urbanDriver.updateComment(transactionID, comment);
      await userRepository.fetch();
    } catch (e) {
      rethrow;
    }
  }

  Future<FlightData> flightData(
    String flightNumber,
    DateTime date,
  ) async {
    return _urbanDriver.flightData(flightNumber: flightNumber, date: date);
  }

  Future<TransactionStatus> transactionStatusByID(int transactionID) async {
    final ud.TransactionStatus status =
        await _urbanDriver.tripStatus(transactionID);
    return status.toDomain;
  }

  Future<ValidatedReservation?> currentReservation() async {
    try {
      return ValidatedReservation.fromJson(
        jsonDecode(
          _cache.get(_kReservationKey),
        ),
      );
    } catch (e) {
      return null;
    }
  }

  Future<void> clearReservation() async {
    await _cache.clear();
  }

  Box get _cache => Hive.box(_kReservationRepositoryKey);
}
