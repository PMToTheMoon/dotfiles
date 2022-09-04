import 'package:json_annotation/json_annotation.dart';

part 'record_priority.g.dart';

@JsonEnum()
enum RecordPriority {
  @JsonValue('LOWEST')
  low,

  @JsonValue('MEDIUM')
  medium,

  @JsonValue('HIGH')
  hight;

  bool get isHightPriority => this != RecordPriority.low;
}
