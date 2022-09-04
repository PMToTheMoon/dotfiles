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

l10n.yaml:
synthetic package is needed to put l10n gen in separated package
```yaml
arb-dir: lib/src/l10n/arb
template-arb-file: zanalys_fr.arb
output-localization-file: app_localizations.dart
nullable-getter: false
synthetic-package: false
```

file.arb:
separator:
```json
"@_ERROR": {
},
```

parameters:
```json
"home_app_bar_title": "Hello {firstName} 👋",
  "@home_app_bar_title": {
    "placeholders": {
        "firstName": {
            "type": "String"
        }
    }
  },
```