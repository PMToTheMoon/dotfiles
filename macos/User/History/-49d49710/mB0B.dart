import 'dart:io';

import 'package:args/command_runner.dart';
import 'logging.dart';

import 'commands/commands.dart';

void main(List<String> args) {
  initializeLogger();

  CommandRunner('bonemeal', 'Grows seeds.')
    ..addCommand(BuildCommand())
    ..addCommand(ExportCommand())
    ..addCommand(CleanCommand())
    ..run(args).catchError((error) {
      if (error is! UsageException) throw error;
      print(error);
      exit(64);
    });
}
