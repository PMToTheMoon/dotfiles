import 'package:dart_style/dart_style.dart';
import 'package:logging/logging.dart';

final _formatter = DartFormatter();

final _log = Logger('Formatter');

String formatDartCode(String code) {
  // final singleNewLine = code.replaceAll(RegExp('\n+'), '\n');
  try {
    return _formatter.format(code);
  } catch (e) {
    _log.severe('Invalid source:');
    _log.severe(code);
    rethrow;
  }
}
