import 'package:app_client/urban_driver_api/models/getme/passenger.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:common/common.dart' as domain;

part 'passenger_batch_replace_request.freezed.dart';

@freezed
class PassengerBatchReplaceRequest with _$PassengerBatchReplaceRequest {
  const PassengerBatchReplaceRequest._();

  const factory PassengerBatchReplaceRequest({
    required List<Passenger> passengers,
  }) = _PassengerBatchReplaceRequest;

  const factory PassengerBatchReplaceRequest.fromDomain({
    required List<domain.Passenger> passengers,
  }) => PassengerBatchReplaceRequest(

  );
}
