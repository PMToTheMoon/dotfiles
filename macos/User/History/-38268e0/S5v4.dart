import 'package:args/command_runner.dart';
import 'package:bonemeal_runner/bonemeal_runner.dart';
import 'package:logging/logging.dart';

final _log = Logger('CleanCommand');

class CleanCommand extends Command {
  @override
  final name = 'clean';

  @override
  final description = 'Clean project';

  @override
  Future<void> run() async {
    _log.info('Cleaning the project...');
    try {
      await cleanIprExportDir();
      _log.fine('Successfully cleaned ipr export dir');
      await cleanOutputExportDir();
      _log.fine('Successfully cleaned target dir');
      await cleanCache();
      _log.fine('Successfully cleaned cache dir');
    } catch (e) {
      _log.severe('Unable to clean project', e);
    }
  }
}
