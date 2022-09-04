import 'package:flutter/material.dart';
import 'package:translations/translations.dart';

enum ServiceType {
  teleExpertise,
  teleConsultation,
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
