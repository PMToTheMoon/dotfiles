import 'package:json_annotation/json_annotation.dart';
import 'doctor_job.dart';
import 'doctor_specialty.dart';
part 'doctor.g.dart';

@JsonSerializable()
class Patient {
  const Patient(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.job,
      required this.specialty});

  factory Patient.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);

  @JsonKey(name: 'numeroCompteUtilisateur')
  final String id;

  @JsonKey(name: 'prenomUtilisateur')
  final String firstName;

  @JsonKey(name: 'nomUtilisateur')
  final String lastName;

  @JsonKey(name: 'PrestataireProfession')
  final DoctorJob job;

  @JsonKey(name: 'PrestataireSpecialite')
  final DoctorSpecialty specialty;
}
