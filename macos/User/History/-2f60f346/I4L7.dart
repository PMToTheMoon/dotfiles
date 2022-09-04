import 'package:bonemeal/bonemeal.dart';
import 'package:bonemeal/src/config/bonemeal_config.dart';
import 'package:bonemeal/src/io/environment.dart';
import 'package:bonemeal/src/meta_object/build_step.dart';

class BuildRunner {
  BuildRunner({
    required this.config,
  }) : _environment = IOEnvironment(config: config);

  final BonemealConfig config;
  final IOEnvironment _environment;

  void build(MetaObject object) {
    _environment.cleanPreviousBuild();
    final initialStep = BuildStep(
      path: '.',
      writer: _environment.writer,
    );
    object.build(initialStep);
  }
}
