import 'package:app_client/urban_driver_api/models/getme/passenger.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_passenger_request.freezed.dart';

@freezed
class PassengerBatchReplace with _$PassengerBatchUpdate {
  const PassengerBatchReplace._();

  const factory PassengerBatchUpdate({
    required List<Passenger> pass,
  }) = _PassengerBatchUpdate;
}
