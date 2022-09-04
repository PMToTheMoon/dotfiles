import 'package:freezed_annotation/freezed_annotation.dart';

import 'grid_filter.dart';

part 'grid_request.g.dart';

enum GridType {
  GRID_PATIENT_EXPERT,
}

@JsonSerializable(createFactory: false)
class GridRequest {
  const GridRequest.patient();

  final GridType gridType;
  final int length;
  final int draw;
  final int start;
  final List<GridFilter> filterParameters;

  factory GridRequest.fromJson(Map<String, dynamic> json) =>
      _$GridRequestFromJson(json);
}
