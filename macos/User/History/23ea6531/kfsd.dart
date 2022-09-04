import 'package:bonemeal/src/run/init.dart';
import 'package:logging/logging.dart';

final _log = Logger('Build');

void build() {
  init();
  _log.info('Initializing bonemeal');
}
