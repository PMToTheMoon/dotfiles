import 'dart:io';

import 'package:logging/logging.dart';
import 'package:args/command_runner.dart';

import 'package:bonemeal/global.dart';

class BuildCommand extends Command {
  final _log = Logger("BuildCommand");

  @override
  final name = "build";

  @override
  final description = "Build IPR in the current directory.";

  @override
  Future<void> run() async {
    _log.fine("start building...");
    final file = File("lib/models.yaml");
    _log.info(await file.readAsString());
    // try {
    //   print(Pub.run(
    //     "build_runner",
    //     arguments: ["build", "--delete-conflicting-outputs"],
    //     // runOptions: RunOptions(runInShell: true),
    //   ));
    // } catch (e) {
    //   print(e);
    // }
  }
}
