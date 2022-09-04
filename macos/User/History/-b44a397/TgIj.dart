import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_passenger_request.freezed.dart';

@freezed
class PassengerBatchUpdate with _$PassengerBatchUpdate {
  const PassengerBatchUpdate._();

  const factory PassengerBatchUpdate({
    required String firstName,
    required String lastName,
    String? email,
    required String phoneNumber,
  }) = _PassengerBatchUpdate;
}
