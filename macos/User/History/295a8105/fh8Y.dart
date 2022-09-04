import 'dart:io';
import 'package:args/command_runner.dart';

import 'commands/commands.dart';
import 'commands/parse_yaml.dart';
import 'logging.dart';

void main(List<String> args) {
  initializeLogger();

  CommandRunner('bonemeal', 'Grows seeds.')
    ..addCommand(BuildCommand())
    ..addCommand(ExportCommand())
    ..addCommand(CleanCommand())
    ..addCommand(ParseYamlCommand())
    ..run(args).catchError((error) {
      if (error is! UsageException) throw error;
      print(error);
      exit(64);
    });
}