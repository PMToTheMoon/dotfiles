import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:common/common.dart' as domain;
import 'package:intl/intl.dart';
import 'vehicle.dart';
part 'trip.freezed.dart';
part 'trip.g.dart';

enum TripStatus {
  finish,
  valid,
  waiting_payment_validation,
}

extension TripStatusToDomain on TripStatus {
  domain.TripStatus get toDomain {
    switch (this) {
      case TripStatus.finish:
        return domain.TripStatus.completed;
      case TripStatus.valid:
        return domain.TripStatus.payed;
      case TripStatus.waiting_payment_validation:
        return domain.TripStatus.waitingPayment;
    }
  }
}

class CustomDateTimeConverter implements JsonConverter<DateTime, String> {
  const CustomDateTimeConverter();

  static final _format = DateFormat("yyyy-MM-dd\tHH:mm:ss");

  @override
  DateTime fromJson(String json) {
    return _format.parse(json);
  }

  @override
  String toJson(DateTime date) => _format.format(date);
}

@freezed
class Trip with _$Trip {
  const Trip._();

  const factory Trip({
    required int id,
    required TripStatus status,
    required String departure,
    required String arrival,
    required DateTime date,
    required String amount,
    required Vehicle vehicule,
    int? transaction_id,
    required List<double> departure_center,
    required List<double> arrival_center,
    required int departure_id,
    required int arrival_id,
    String? comment,
  }) = _Trip;

  factory Trip.fromJson(Map<String, dynamic> json) => _$TripFromJson(json);

  domain.Trip toDomain(List<domain.FavoriteAddress> addresses) => domain.Trip(
        id: id,
        status: status.toDomain,
        departure: addresses.firstWhereOrNull((a) => a.id == departure_id) ??
            domain.FavoriteAddress(
                id: id,
                label: "invalid address",
                section: "section",
                type: domain.AddressType.location,
                address: "invalid address",
                center: [0, 0]),
        arrival: addresses.firstWhereOrNull((a) => a.id == arrival_id)!,
        date: date,
        price: double.parse(amount),
        vehicle: vehicule.toDomain,
        transactionID: transaction_id,
        comment: comment,
      );
}
