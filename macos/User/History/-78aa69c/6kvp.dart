import 'package:dart_style/dart_style.dart';

final _formatter = DartFormatter();

String formatDartCode(String code) {
  final singleNewLine = code.replaceAll(RegExp('\n+'), ' ');
  _formatter.format(code);
}

final fix = StyleFix.namedDefaultSeparator;
