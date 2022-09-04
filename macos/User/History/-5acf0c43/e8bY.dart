import 'dart:io';

import 'package:logging/logging.dart';
import "package:console/console.dart";

const _successColor = 2;
const _errorColor = 1;
const _warningColor = 11;

void _printFormatted(
  String message, {
  int? color,
  bool bold = false,
  bool italic = false,
  bool write = false,
  bool bright = false,
}) {
  if (color != null) {
    Console.setTextColor(color);
  }
  Console.setBold(bold);
  Console.setItalic(italic);
  if (write) {
    stdout.write(message);
  } else {
    print(message);
  }
  Console.resetAll();
}

void _printWithBoldHead(
  LogRecord record, {
  int? color,
  bool printMessageInBold = false,
  bool printMessageInItalic = false,
  bool printTime = false,
}) {
  _printFormatted(
    printTime
        ? "${record.time}: ${record.loggerName}: "
        : "${record.loggerName}: ",
    color: color,
    bold: true,
    write: true,
  );

  _printFormatted(
    record.message,
    color: color,
    bold: printMessageInBold,
    italic: printMessageInItalic,
  );
}

void _printFormattedMessage(LogRecord record) {
  if (record.level == Level.CONFIG) {
    print(record.message);
  } else if (record.level == Level.INFO) {
    print(record.message);
  } else if (record.level == Level.FINE) {
    _printWithBoldHead(record, color: _successColor);
  } else if (record.level == Level.FINER) {
    _printWithBoldHead(record, color: _successColor);
  } else if (record.level == Level.FINEST) {
    _printWithBoldHead(record, color: _successColor, printMessageInBold: true);
  } else if (record.level == Level.WARNING) {
    _printWithBoldHead(record, color: _warningColor, printTime: true);
  } else if (record.level == Level.SEVERE) {
    _printWithBoldHead(record, color: _errorColor, printTime: true);
  } else if (record.level == Level.SHOUT) {
    _printWithBoldHead(record,
        color: _errorColor, printTime: true, printMessageInBold: true);
  }
}

void initializeLogger() {
  Console.init();
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen(_printFormattedMessage);
}
