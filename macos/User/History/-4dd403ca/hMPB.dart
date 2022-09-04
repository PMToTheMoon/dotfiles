import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/models.dart';

part 'add_doctor_to_record_request.g.dart';

@JsonSerializable()
class AddDoctorToRecordRequest {
  const AddDoctorToRecordRequest({
    required this.providerId,
    required this.serviceType,
  });

  @JsonKey(name: 'prestataire')
  final String providerId;

  @JsonKey(name: 'requestedPrestation')
  final ServiceType serviceType;

  Map<String, dynamic> toJson() => _$AddDoctorToRecordRequestToJson(this);
}
