import 'package:json_annotation/json_annotation.dart';

part 'doctor_specialty.g.dart';

@JsonSerializable()
class DoctorSpecialty {
  DoctorSpecialty({
    required this.id,
    required this.displayFr,
  });

  final String id;
  @JsonKey()
  final String displayFr;

  factory DoctorSpecialty fromJson(Map<String, dynamic> json) =>
      _$DoctorSpecialtyFromJson(json);
}
