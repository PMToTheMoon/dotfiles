import 'package:freezed_annotation/freezed_annotation.dart';

part 'grid_request.g.dart';

enum GridType {
  GRID_PATIENT_EXPERT,
}

@JsonSerializable()
class GridRequest {
  const GridRequest();

  final GridType gridType;
  final GridType length;
  final GridType draw;
  final GridType start;

  factory GridRequest.fromJson(Map<String, dynamic> json) =>
      _$GridRequestFromJson(json);
}
