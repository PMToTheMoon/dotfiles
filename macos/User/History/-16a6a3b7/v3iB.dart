import 'package:json_annotation/json_annotation.dart';

enum ComplementType {
  @JsonValue('CR_CONSULTATION')
  crConsultation,

  @JsonValue('SUIVI_PARCOURS')
  recordFollowup,

  @JsonValue('CR_EXAMEN')
  exam,
}
