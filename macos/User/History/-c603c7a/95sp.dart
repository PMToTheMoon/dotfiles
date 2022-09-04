import 'package:json_annotation/json_annotation.dart';

part 'doctor_specialty.g.dart';

@JsonSerializable()
class DoctorSpecialty {
  DoctorSpecialty({
    required this.id,
    required this.displayFr,
  });

  final String id;
  final String displayFr;

  DoctorSpecialty fromJson(Map<String, dynamic> json) =>
      _$DoctorSpecialtyFromJson(json);
}
