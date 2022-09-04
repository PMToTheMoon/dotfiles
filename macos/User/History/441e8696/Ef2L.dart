import 'package:bonemeal_runner/src/package_graph/apply_generators.dart';

import 'build_result.dart';

Future<BuildResult> build(List<GeneratorApplication> applications) async {
  applications.forEach((element) => print(element.toString()));
  throw UnimplementedError();
}
