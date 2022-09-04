import 'package:bonemeal_runner/src/build_script_generate/bootstrap.dart';
import 'package:logging/logging.dart';
import 'package:args/command_runner.dart';

import 'package:bonemeal_runner/bonemeal_runner.dart';

class BuildCommand extends Command {
  final _log = Logger('BuildCommand');

  @override
  final name = 'build';

  @override
  final description = 'Build IPR in the current directory.';

  @override
  Future<void> run() async {
    _log.info('start building...');
    final generators = await generateAndRun([]);
    _log.fine('successfully built project');
  }
}
