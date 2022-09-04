import 'package:args/command_runner.dart';
import 'package:logging/logging.dart';

class CreateCommand extends Command {
  final _log = Logger("CleanCommand");

  @override
  final name = "clean";

  @override
  final description = "Clean generated code";

  @override
  void run() {
    _log.info("Cleaning generated files in ");
  }
}
