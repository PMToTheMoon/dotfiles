import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:bonemeal/src/utils/yaml.dart';

class ParseYamlCommand extends Command {
  @override
  final name = 'parse_yaml';

  @override
  final description = 'Parse yaml then dump result in console.';

  @override
  void run() {
    final file = File("lib/test.yaml");
    print(loadYamlMap(file.readAsStringSync()));
  }
}
