import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

void initializeLogger() {
  if (kDebugMode) {
    Logger.root.level = Level.ALL; // defaults to Level.INFO
    Logger.root.onRecord.listen((record) {
      debugPrint('[${record.level.name}]: ${record.message}');
    });
  }
}
