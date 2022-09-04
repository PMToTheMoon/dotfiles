import 'dart:io';

import 'package:checked_yaml/checked_yaml.dart';
import 'package:logging/logging.dart';
import 'package:args/command_runner.dart';

import 'package:bonemeal/global.dart';
import 'package:bonemeal/generators/generators.dart';

class BuildCommand extends Command {
  final _log = Logger("BuildCommand");

  @override
  final name = "build";

  @override
  final description = "Build IPR in the current directory.";

  @override
  Future<void> run() async {
    _log.info("start building...");
    final step = BuildStep();
    await ModelsGenerator().generate(step);
    final assets = step.buildContext();
    _log.fine(assets);
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
