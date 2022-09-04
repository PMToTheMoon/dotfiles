import 'package:bonemeal_runner/src/generate/apply_generators.dart';

import 'build_result.dart';

Future<BuildResult> build(List<GeneratorApplication> applications) async {
  applications.forEach((element) => print(element.toString()));
  throw UnimplementedError();
}
