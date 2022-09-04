import 'package:freezed_annotation/freezed_annotation.dart';

import 'grid_filter.dart';

enum GridType {
  @JsonValue('GRID_PATIENT_EXPERT')
  patientExpert,
}

@JsonSerializable()
class GridRequest {
  const GridRequest();

  final int start;
  final int length;
  final int draw;
  final GridType type;
  final List<GridFilter> filters;

  factory GridRequest.fromJson(Map<String, dynamic> json) =>
      _$GridPatientRequestFromJson(json);
}
