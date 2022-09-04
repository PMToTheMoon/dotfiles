import 'package:args/command_runner.dart';
import 'package:logging/logging.dart';

final _log = Logger('Clean command');

class CleanCommand extends Command {
  @override
  final name = 'clean';

  @override
  final description = 'Clean project';

  @override
  Future<void> run() async {}
}
