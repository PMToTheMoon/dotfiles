// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grid_patient_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GridPatientResponse _$GridPatientResponseFromJson(Map<String, dynamic> json) =>
    GridPatientResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => Patienteu.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GridPatientResponseToJson(
        GridPatientResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
