l10n extension:
```dart
import 'package:flutter/material.dart';

import 'arb/app_localizations.dart';

export 'arb/app_localizations.dart';

extension ZanalysTranslations on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
```

pubspec.yaml:
```yaml
generate: true
```