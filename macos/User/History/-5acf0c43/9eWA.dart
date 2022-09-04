import 'dart:io';

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
  bool printMessageInBold = false,
  bool printMessageInItalic = false,
  bool printTime = false,
}) {
  _format(color: color, bold: true);
  if (printTime) stdout.write("${record.time}: ");
  stdout.write("${record.loggerName}: ");

  _format(
    color: color,
    bold: printMessageInBold,
    italic: printMessageInItalic,
  );

  print(record.message);
}

void _printFormattedMessage(LogRecord record) {
  if (record.level == Level.INFO) {
    print(record.message);
  } else if (record.level == Level.FINE) {
    _printWithBoldHead(record, color: _successColor);
  } else if (record.level == Level.FINER) {
    _printWithBoldHead(record, color: _successColor);
  } else if (record.level == Level.FINEST) {
    _printWithBoldHead(record, color: _successColor);
  } else if (record.level == Level.WARNING) {
    _printWithBoldHead(record, color: _warningColor, printTime: true);
  } else if (record.level == Level.SEVERE) {
    _printWithBoldHead(record, color: _errorColor, printTime: true);
  } else if (record.level == Level.SHOUT) {
    _printWithBoldHead(record, color: _errorColor, printTime: true);
  }
  _resetFormat();
}

void initializeLogger() {
  Console.init();
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen(_printFormattedMessage);
}
