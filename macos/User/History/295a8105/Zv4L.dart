import 'dart:io';

import 'package:args/command_runner.dart';
import 'commands/commands.dart';

void main(List<String> args) {
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });

  CommandRunner("bonemeal", "Grows seeds.")
    ..addCommand(BuildCommand())
    ..addCommand(ExportCommand())
    ..run(args).catchError((error) {
      if (error is! UsageException) throw error;
      print(error);
      exit(64);
    });
}
