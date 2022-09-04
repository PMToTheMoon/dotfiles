import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/models.dart';

@JsonSerializable()
class AddDoctorToRecordRequest {
  const AddDoctorToRecordRequest();

  @JsonKey(name: 'prestataire')
  final String providerId;

  @JsonKey(name: 'requestedPrestation')
  final ServiceType serviceType;

  Map<String, dynamic> toJson() => _$AddDoctorToRecordRequestToJson(this);
}
