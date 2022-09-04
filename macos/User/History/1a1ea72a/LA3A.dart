import 'package:args/command_runner.dart';
import 'package:bonemeal_core/src/config/bonemeal_config.dart';
import 'package:bonemeal_core/src/io/environment.dart';
import 'package:logging/logging.dart';

final _log = Logger('CleanCommand');

class CleanCommand extends Command {
  @override
  final name = 'clean';

  @override
  final description = 'Clean project';

  @override
  Future<void> run() async {
    final config = await BonemealConfig.fromRoot();
    final environment = IOEnvironment(config: config);
    _log.info('Cleaning the project...');
    try {
      environment.cleanPreviousBuild();
      _log.finest('done');
    } catch (e) {
      _log.severe('Unable to clean project', e);
    }
  }
}
