import 'package:args/command_runner.dart';
import 'package:logging/logging.dart';
import 'package:bonemeal/global.dart';

class CleanCommand extends Command {
  final _log = Logger("CleanCommand");

  @override
  final name = "clean";

  @override
  final description = "Clean generated code";

  @override
  void run() {
    _log.info("Cleaning generated files in $contextPath...");
    try {
      fs.directory(contextPath).deleteSync(recursive: true);
      _log.fine("Cleaning generated files in $contextPath...");
    } catch (e) {
      _log.severe("Clean failed.");
    }
  }
}
