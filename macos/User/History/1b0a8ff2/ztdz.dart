import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

void initializeLogger() {
  // TODO: add dev, pre-prod and prod setup
  if (kDebugMode) {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      debugPrint(
        '[${record.level.name}] ${record.loggerName}: ${record.message}',
      );
    });
  }
}
