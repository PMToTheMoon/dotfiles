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
flutter:
  uses-material-design: true
  generate: true
```

l10n.yaml
```yaml
arb-dir: lib/src/l10n/arb
template-arb-file: zanalys_fr.arb
output-localization-file: app_localizations.dart
nullable-getter: false
synthetic-package: false
```