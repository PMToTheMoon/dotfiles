import 'dart:io';
import 'package:logging/logging.dart';
import 'package:args/command_runner.dart';
import 'commands/commands.dart';

void main(List<String> args) {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
  final log = Logger("Bonemeal");

  CommandRunner("bonemeal", "Grows seeds.")
    ..addCommand(BuildCommand())
    ..addCommand(ExportCommand())
    ..run(args).catchError((error) {
      if (error is! UsageException) throw error;
      log.shout(":(");
      exit(64);
    });
}
