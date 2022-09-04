import 'package:freezed_annotation/freezed_annotation.dart';
import 'vehicle.dart';

import 'address.dart';

part 'trip.freezed.dart';
part 'trip.g.dart';

enum TripStatus {
  completed,
  payed,
  waitingPayment,
  canceled,
}

@freezed
class Trip with _$Trip {
  const Trip._();

  const factory Trip({
    required int id,
    required TripStatus status,
    required Address departure,
    required Address arrival,
    required DateTime date,
    required double price,
    required Vehicle vehicle,
    int? transactionID,
    String? comment,
  }) = _Trip;

  factory Trip.fromJson(Map<String, dynamic> json) => _$TripFromJson(json);
}
