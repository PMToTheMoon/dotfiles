import 'package:bonemeal_core/bonemeal_core.dart';
import 'package:bonemeal_core/src/config/bonemeal_config.dart';
import 'package:bonemeal_core/src/io/environment.dart';
import 'package:bonemeal_core/src/meta_object/build_step.dart';

class BuildRunner {
  BuildRunner({
    required this.config,
  }) : _environment = IOEnvironment(config: config);

  final BonemealConfig config;
  final IOEnvironment _environment;

  void build(MetaObject object) {
    _environment.cleanPreviousBuild();
    final initialStep = BuildStep(
      path: '',
      writer: _environment.writer,
    );
    object.build(initialStep);
    _environment.exportBuild();
  }
}
