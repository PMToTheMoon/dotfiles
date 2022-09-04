import 'dart:io';
import 'package:logging/logging.dart';
import 'package:args/command_runner.dart';
import 'commands/commands.dart';

void main(List<String> args) {
  Logger("Bonemeal").info("starting...");

  CommandRunner("bonemeal", "Grows seeds.")
    ..addCommand(BuildCommand())
    ..addCommand(ExportCommand())
    ..run(args).catchError((error) {
      if (error is! UsageException) throw error;
      print(error);
      exit(64);
    });
}
