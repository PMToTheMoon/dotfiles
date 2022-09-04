// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Patient _$PatientFromJson(Map<String, dynamic> json) => Patient(
      id: json['numeroCompte'] as String,
      firstName: json['prenom'] as String?,
      lastName: json['nom'] as String?,
    );

Map<String, dynamic> _$PatientToJson(Patient instance) => <String, dynamic>{
      'numeroCompte': instance.id,
      'prenom': instance.firstName,
      'nom': instance.lastName,
    };
