import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:bonemeal_core/src/logging/logging.dart';

import 'commands/clean.dart';

void main(List<String> args) {
  init();

  CommandRunner('bonemeal', 'Grows seeds.')
    ..addCommand(CleanCommand())
    ..run(args).catchError((error) {
      if (error is! UsageException) throw error;
      print(error);
      exit(64);
    });
}
