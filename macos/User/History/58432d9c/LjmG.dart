import 'package:flutter/material.dart';

import 'arb/app_localizations.dart';

extension ZanalysTranslations on BuildContext {
  String get l10n {
    return AppLocalizations.of(this)
  }
}