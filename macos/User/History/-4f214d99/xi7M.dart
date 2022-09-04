// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Patient _$DoctorFromJson(Map<String, dynamic> json) => Patient(
      id: json['numeroCompteUtilisateur'] as String,
      firstName: json['prenomUtilisateur'] as String,
      lastName: json['nomUtilisateur'] as String,
      job: DoctorJob.fromJson(
          json['PrestataireProfession'] as Map<String, dynamic>),
      specialty: DoctorSpecialty.fromJson(
          json['PrestataireSpecialite'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DoctorToJson(Patient instance) => <String, dynamic>{
      'numeroCompteUtilisateur': instance.id,
      'prenomUtilisateur': instance.firstName,
      'nomUtilisateur': instance.lastName,
      'PrestataireProfession': instance.job,
      'PrestataireSpecialite': instance.specialty,
    };
