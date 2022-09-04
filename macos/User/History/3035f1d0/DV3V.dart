import 'package:logging/logging.dart';
import 'package:args/command_runner.dart';

import 'package:bonemeal/bonemeal.dart' as bonemeal;

class BuildCommand extends Command {
  final _log = Logger("BuildCommand");

  @override
  final name = "build";

  @override
  final description = "Build IPR in the current directory.";

  @override
  Future<void> run() async {
    _log.info("start building...");
    bonemeal.build();
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
