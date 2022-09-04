import 'package:dart_style/dart_style.dart';

final _formatter = DartFormatter();

String formatDartCode(String code) {
  String result = _myText.replaceAll(RegExp(' +'), ' ');
  _formatter.format(code);
}

final fix = StyleFix.namedDefaultSeparator;
