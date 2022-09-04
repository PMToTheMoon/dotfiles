import 'dart:io';
import 'package:args/command_runner.dart';
import 'package:logging/logging.dart';

import 'commands/commands.dart';
import 'logging.dart';

void main(List<String> args) {
  initializeLogger();

  final log = Logger("Test");
  .info("hey it's just some info");
  Logger("Test").info("hey it's just some info");

  // CommandRunner("bonemeal", "Grows seeds.")
  //   ..addCommand(BuildCommand())
  //   ..addCommand(ExportCommand())
  //   ..run(args).catchError((error) {
  //     if (error is! UsageException) throw error;
  //     print(error);
  //     exit(64);
  //   });
}
