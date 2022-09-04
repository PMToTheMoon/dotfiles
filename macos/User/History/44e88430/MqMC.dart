import 'package:freezed_annotation/freezed_annotation.dart';

part 'flight.freezed.dart';

@freezed
class FlightData with _$FlightData {
  const FlightData._();

  const factory FlightData({
    required DateTime arrivalTime,
    required int id,
  }) = _FlightData;
}
