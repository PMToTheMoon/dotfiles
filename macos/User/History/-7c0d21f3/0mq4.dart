import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:translations/translations.dart';

@JsonEnum()
enum ServiceType {
  @JsonValue('TE')
  teleExpertise,

  @JsonValue('TC')
  teleConsultation,

  @JsonValue('PRESENTIEL')
  inPerson;

  String display(BuildContext context) {
    switch (this) {
      case ServiceType.teleExpertise:
        return context.l10n.request_tele_expertise;
      case ServiceType.teleConsultation:
        return context.l10n.request_consultation;
      case ServiceType.inPerson:
        return context.l10n.request_consultation;
    }
  }
}
