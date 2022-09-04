import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:bonemeal/src/logging/logging.dart';
import 'package:bonemeal_runner/bonemeal_runner.dart';

import 'bin/commands/commands.dart';
import 'commands/clean.dart';

void main(List<String> args) {
  initializeLogger();

  CommandRunner('bonemeal', 'Grows seeds.')
    // ..addCommand(BuildCommand())
    ..addCommand(CleanCommand())
    ..run(args).catchError((error) {
      if (error is! UsageException) throw error;
      print(error);
      exit(64);
    });
}
