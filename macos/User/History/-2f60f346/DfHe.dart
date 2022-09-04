import 'package:bonemeal/bonemeal.dart';
import 'package:bonemeal/src/io/environment.dart';
import 'package:bonemeal/src/meta_object/build_step.dart';

class BuildRunner {
  BuildRunner(
    this.environment,
  );

  final IOEnvironment environment;

  void build(MetaObject object) {
    final initialStep = BuildStep(
      '.',
      writer: environment.writer,
    );
    object.build(step);
  }
}
