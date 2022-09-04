import 'package:freezed_annotation/freezed_annotation.dart';

part 'grid_request.g.dart';

@JsonEnum(alwaysCreate: true)
enum GridType {
  @JsonValue('GRID_PATIENT_EXPERT')
  patientExpert;

  String toJson() => _$GridTypeEnumMap[this]!;
}
