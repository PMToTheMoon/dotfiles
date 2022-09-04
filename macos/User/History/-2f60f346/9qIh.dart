import 'package:bonemeal/bonemeal.dart';
import 'package:bonemeal/src/io/environment.dart';
import 'package:bonemeal/src/meta_object/build_step.dart';

class BuildRunner {
  BuildRunner();

  final IOEnvironment environment = IOEnvironment();

  void build(MetaObject object) {
    final initialStep = BuildStep(
      path: '.',
      writer: environment.writer,
    );
    object.build(initialStep);
  }
}
