import 'package:bonemeal/bonemeal.dart';
import 'package:bonemeal/src/config/bonemeal_config.dart';
import 'package:bonemeal/src/run/build_runner.dart';
import 'package:bonemeal/src/run/init.dart';
import 'package:logging/logging.dart';

final _log = Logger('Build');

Future<void> build(MetaObject object) async {
  init();
  _log.info('Initializing bonemeal');
  try {
    final config = await BonemealConfig.fromRoot();
    _log.fine('Output dir: ${config.outputDir}');

    final runner = BuildRunner(config: config);
    runner.build(object);
    _log.fine('Success');
  } catch (e, s) {
    _log.severe('''
Build failed.
reason: ${e..toString()}
from:
$s
''');
  }
}
