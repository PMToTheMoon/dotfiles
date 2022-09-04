import 'package:logging/logging.dart';
import 'package:args/command_runner.dart';

import 'package:bonemeal_core/bonemeal_core' as bonemeal;

class BuildCommand extends Command {
  final _log = Logger('BuildCommand');

  @override
  final name = 'build';

  @override
  final description = 'Build IPR in the current directory.';

  @override
  Future<void> run() async {
    _log.info('start building...');
    await bonemeal.build();
    _log.fine('successfully built project');
  }
}
