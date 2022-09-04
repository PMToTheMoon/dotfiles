import 'dart:io';
import 'package:args/command_runner.dart';
import 'package:logging/logging.dart';

import 'commands/commands.dart';
import 'logging.dart';

void main(List<String> args) {
  initializeLogger();

  final log = Logger("Test");
  log.config("Just some config infos");
  log.info("Hey it's just some info");
  log.fine("Everything fine");
  log.finer("Nice bro, it's going pretty well !");
  log.finest("You're the best 💙");
  log.warning("Be careful !");
  log.severe("I think we can't do anything about it.");
  log.shout("STOP DOING THIS!!!!");

  CommandRunner("bonemeal", "Grows seeds.")
    ..addCommand(BuildCommand())
    ..addCommand(ExportCommand())
    ..run(args).catchError((error) {
      if (error is! UsageException) throw error;
      print(error);
      exit(64);
    });
}
