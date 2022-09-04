// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/models.dart';

part 'doctor_service_request.freezed.dart';
part 'doctor_service_request.g.dart';

@freezed
class DoctorServiceRequest with _$DoctorServiceRequest {
  const DoctorServiceRequest._();

  const factory DoctorServiceRequest({
    @JsonKey(name: 'numeroCompte') required String doctorId,
    @JsonKey(name: 'prestationDemandee') required ServiceType service,
  }) = _DoctorServiceRequest;

  factory DoctorServiceRequest.fromJson(Map<String, dynamic> json) =>
      _$DoctorServiceRequestFromJson(json);
}
