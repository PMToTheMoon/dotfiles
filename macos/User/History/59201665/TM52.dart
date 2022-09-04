import 'package:freezed_annotation/freezed_annotation.dart';

@JsonSerializable()
class GridPatientResponse {
  const GridPatientResponse();

  List<Patient> data;

  factory GridPatientResponse.fromJson(Map<String, dynamic> json) =>
      _$GridPatientResponseFromJson(json);
}
