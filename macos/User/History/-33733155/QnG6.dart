import 'package:acyclic_steps/acyclic_steps.dart';
import 'package:glob/glob.dart';
import 'package:glob/list_local_fs.dart';

import 'package:bonemeal/build_system/build_system.dart';
import 'build_steps.dart';

final Step<BuildStep> runGeneratorsStep = Step.define(
  'parse_sources',
).dep(parseConfig).build((step) {
  final dartFile = Glob('**.dart');
  for (var entity in dartFile.listSync()) {
    print(entity.path);
  }
});
