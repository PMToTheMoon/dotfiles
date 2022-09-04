import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:common/common.dart';
part 'flightstatus.freezed.dart';

@freezed
class FlightStatus with _$FlightStatus {
  const FlightStatus._();

  const factory FlightStatus({
    required DateTime arrivalTime,
    required int id,
  }) = _FlightStatus;

  factory FlightStatus.fromJson(Map<String, dynamic> json) =>
      _$FlightStatusFromJson(json);

  FlightData toDomain() => FlightData(
        arrivalTime: arrivalTime,
        id: id,
      );
}
