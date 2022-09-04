import 'package:flutter/material.dart';
import 'package:translations/translations.dart';

enum RecordType {
  general,
  ecg;

  String get displayName(BuildContext context) => context.l10n.
}
