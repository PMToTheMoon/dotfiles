import 'package:freezed_annotation/freezed_annotation.dart';

part 'flightstatus.freezed.dart';

@freezed
class FlightStatus with _$FlightStatus {
  const FlightStatus._();

  const factory FlightStatus({
    required DateTime arrivalTime,
    required int id,
  }) = _FlightStatus;
}
