import 'package:bonemeal_core/bonemeal_core.dart';
import 'package:bonemeal_core/src/config/bonemeal_config.dart';
import 'package:bonemeal_core/src/io/environment.dart';

class BuildRunner {
  BuildRunner({
    required this.config,
  }) : _environment = IOEnvironment(config: config);

  final BonemealConfig config;
  final IOEnvironment _environment;

  void build(MetaObject object) {
    _environment.cleanPreviousBuild();
    final initialStep = BuildStepImpl(
      path: '',
      writer: _environment.writer,
      outputPackage: _environment.outputPackageName,
    );
    initialStep.build(object);
    _environment.exportBuild();
  }
}
