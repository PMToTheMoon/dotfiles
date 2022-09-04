import 'package:flutter/material.dart';
import 'package:translations/translations.dart';

enum RecordType {
  general,
  ecg,
  polygraphy;

  String displayName(BuildContext context) {
    switch (this) {
      case RecordType.general:
        return context.l10n.record_type_general;
      case RecordType.ecg:
        return context.l10n.record_type_ecg;
      case RecordType.polygraphy:
        return context.l10n.record_type_ecg;
    }
  }
}
