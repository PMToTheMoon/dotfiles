import 'package:freezed_annotation/freezed_annotation.dart';

import 'grid_filter.dart';

part 'grid_request.g.dart';

@JsonEnum()
enum GridType {
  @JsonValue('GRID_PATIENT_EXPERT')
  doctorPatients,
}

@JsonSerializable(createFactory: false)
class GridRequest {
  const GridRequest.patient({
    this.length = 0,
    this.draw = 0,
    this.start = 0,
    this.filters = const [],
  }) : type = GridType.doctorPatients;

  @JsonKey(name: 'gridType')
  final GridType type;

  final int length;
  final int draw;
  final int start;

  @JsonKey(name: 'filterParameters')
  final List<GridFilter> filters;

  Map<String, dynamic> toJson() => _$GridRequestToJson(this);
}
