import 'package:freezed_annotation/freezed_annotation.dart';

import 'grid_filter.dart';

part 'grid_request.g.dart';

enum GridType {
  @JsonValue('GRID_PATIENT_EXPERT')
  patientExpert,
}

@JsonSerializable()
class GridRequest {
  const GridRequest(
    this.type, {
    int? start,
    int? length,
    int? draw,
    List<GridFilter>? filters,
  })  : start = start ?? 0,
        length = length ?? 30,
        draw = draw ?? 0,
        filters = filters ?? const [];

  final GridType type;
  final int start;
  final int length;
  final int draw;
  final List<GridFilter> filters;

  factory GridRequest.fromJson(Map<String, dynamic> json) =>
      _$GridRequestFromJson(json);
}
