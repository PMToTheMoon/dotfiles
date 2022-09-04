import 'package:json_annotation/json_annotation.dart';

part 'patient.g.dart';

@JsonSerializable()
class Patienteu {
  const Patienteu({
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  @JsonKey(name: 'numeroCompte')
  final String id;

  @JsonKey(name: 'prenom')
  final String? firstName;

  @JsonKey(name: 'nom')
  final String? lastName;

  factory Patienteu.fromJson(Map<String, dynamic> json) =>
      _$PatientFromJson(json);
}
