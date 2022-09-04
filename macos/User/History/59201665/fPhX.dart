import 'package:freezed_annotation/freezed_annotation.dart';

@JsonSerializable()
class GridPatientResponse {
  const GridPatientResponse();

  factory GridPatientResponse.fromJson(Map<String, dynamic> json) =>
      _$GridPatientResponseFromJson(json);
}
