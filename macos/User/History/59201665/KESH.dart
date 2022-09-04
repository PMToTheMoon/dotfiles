import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zanalys_api/src/patient_api/models/patient.dart';

part 'grid_patient_response.g.dart';

@JsonSerializable()
class GridPatientResponse {
  const GridPatientResponse({
    required this.data,
  });

  List<Patient> data;

  factory GridPatientResponse.fromJson(Map<String, dynamic> json) =>
      _$GridPatientResponseFromJson(json);
}
