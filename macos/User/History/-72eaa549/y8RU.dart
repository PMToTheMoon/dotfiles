import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum RecordReason {
  @JsonValue('SPORT')
  sport,

  @JsonValue('PRESCRIPTION_MEDICAMENT')
  prescription,

  @JsonValue('DOULEUR_THORACIQUE')
  chestPain,
}
