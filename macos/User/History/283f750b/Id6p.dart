import 'package:freezed_annotation/freezed_annotation.dart';

import 'grid_filter.dart';

part 'grid_request.g.dart';

enum GridType {
  GRID_PATIENT_EXPERT,
}

@JsonSerializable(createFactory: false)
class GridRequest {
  const GridRequest.patient({
    this.length = 0,
    this.draw = 0,
    this.start = 0,
    this.filters = const [],
  });

  final GridType gridType;
  final int length;
  final int draw;
  final int start;
  final List<GridFilter> filters;

  GridRequest toJson(Map<String, dynamic> json) => _$GridRequestToJson(json);
}
