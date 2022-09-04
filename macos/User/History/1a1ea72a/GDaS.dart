import 'package:args/command_runner.dart';
import 'package:file/file.dart';
import 'package:logging/logging.dart';
import 'package:bonemeal/global.dart';

class CleanCommand extends Command {
  final _log = Logger("CleanCommand");

  @override
  final name = "clean";

  @override
  final description = "Clean generated code";

  @override
  Future<void> run() async {
    _log.info("Cleaning generated files in $contextPath...");
    final cleanDir = fs.directory(contextPath);
    if (await cleanDir.exists())
      try {
        await cleanDir.delete(recursive: true);
      } catch (e) {
        _log.severe("Clean failed.");
      }
  }
}
