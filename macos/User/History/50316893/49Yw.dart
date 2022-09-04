// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_service_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DoctorServiceRequest _$$_DoctorServiceRequestFromJson(
        Map<String, dynamic> json) =>
    _$_DoctorServiceRequest(
      doctorId: json['doctorId'] as String,
      service: $enumDecode(_$ServiceTypeEnumMap, json['service']),
    );

Map<String, dynamic> _$$_DoctorServiceRequestToJson(
        _$_DoctorServiceRequest instance) =>
    <String, dynamic>{
      'doctorId': instance.doctorId,
      'service': _$ServiceTypeEnumMap[instance.service]!,
    };

const _$ServiceTypeEnumMap = {
  ServiceType.teleExpertise: 'teleExpertise',
  ServiceType.teleConsultation: 'consultation',
};
