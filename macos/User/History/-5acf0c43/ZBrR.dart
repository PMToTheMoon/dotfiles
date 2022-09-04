import 'package:logging/logging.dart';
import "package:console/console.dart";

const _defaultColor = 7;
const _successColor = 2;
const _errorColor = 1;
const _warningColor = 3;

void _format({
  int? color,
  bool bold = false,
  bool italic = false,
}) {
  if (color != null) {
    Console.setTextColor(color);
  } else {
    Console.setTextColor(_defaultColor);
  }
  Console.setBold(bold);
  Console.setItalic(italic);
}

void _resetFormat() {
  Console.setTextColor(_defaultColor);
  Console.setBold(false);
  Console.setItalic(false);
}

void _printWithBoldHead(
  LogRecord record, {
  int? color,
  bool printMessageInItalic = false,
  bool printTime = false,
}) {
  _format(color: color, bold: true);
  if (printTime) print("${record.time}: ");
  print("${record.loggerName}: ");
  if (printMessageInItalic) _format(color: color, italic: true);
  print(record.message);
}

void _printFormattedMessage(LogRecord record) {
  if (record.level == Level.INFO) {
    print(record.message);
  } else if (record.level == Level.FINE) {
    _printWithBoldHead(record);
  } else if (record.level == Level.FINER) {
    _format(color: _successColor); // green
    print("${record.loggerName}: ${record.message}");
  } else if (record.level == Level.FINEST) {
    _format(color: 2); // green
    print("${record.loggerName}: ${record.message}");
  } else if (record.level == Level.WARNING) {
    _format(color: 3); // yellow
    print("${record.time}: ${record.loggerName}: ${record.message}");
  } else if (record.level == Level.SEVERE) {
    _format(color: 1); // red
    print("${record.time}: ${record.loggerName}: ${record.message}");
  } else if (record.level == Level.SHOUT) {
    _format(color: 1, bold: true); // red
    print("${record.time}: ${record.loggerName}: ${record.message}");
  }
  _resetFormat();
}

void initializeLogger() {
  Console.init();
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen(_printFormattedMessage);
}
