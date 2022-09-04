import 'package:json_annotation/json_annotation.dart';

part 'patient.g.dart';

@JsonSerializable()
class Patient {
  const Patient({
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

  factory Patient.fromJson(Map<String, dynamic> json) =>
      _$PatientFromJson(json);

  Map<String, dynamic> toJson() => _$PatientToJson(this);

  String get displayFullName => '$firstName $lastName';
}
