import 'package:flutter/material.dart';
import 'package:translations/translations.dart';

enum ServiceType {
  teleExpertise,
  consultation;

  String display(BuildContext context) {
    switch (this) {
      case ServiceType.teleExpertise:
        return context.l10n.request_tele_expertise;
      case ServiceType.consultation:
        return context.l10n.request_consultation;
    }
  }
}
