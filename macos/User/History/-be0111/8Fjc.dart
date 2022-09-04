import 'package:json_annotation/json_annotation.dart';
import 'doctor_job.dart';
import 'doctor_specialty.dart';
part 'network_doctor.g.dart';

@JsonSerializable()
class NetworkDoctor {
  const NetworkDoctor(
      {required this.id,
      required this.firstName,
      required this.lastName,
      this.job,
      this.specialty,
      this.acceptedDate});

  factory NetworkDoctor.fromJson(Map<String, dynamic> json) =>
      _$NetworkDoctorFromJson(json);

  @JsonKey(name: 'numeroCompteUtilisateur')
  final String id;

  @JsonKey(name: 'prenomUtilisateur')
  final String firstName;

  @JsonKey(name: 'nomUtilisateur')
  final String lastName;

  @JsonKey(name: 'profession')
  final DoctorJob? job;

  @JsonKey(name: 'specialite')
  final DoctorSpecialty? specialty;

  final int? acceptedDate;

  Map<String, dynamic> toJson() => _$NetworkDoctorToJson(this);
}
