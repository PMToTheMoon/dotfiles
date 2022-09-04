import 'package:json_annotation/json_annotation.dart';

enum ComplementType {
  @JsonValue('')
  crConsultation,

  @JsonValue('SUIVI_PARCOURS')
  recordFollowup,
}
