import 'package:bonemeal/bonemeal.dart';

extension TranslationExtension on String {
  Expression get tr =>
      refer('context.l10n.$this', 'package:translations/translations.dart');
}
