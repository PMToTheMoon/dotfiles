import 'package:bonemeal_runner/src/generator/apply.dart';

import 'build_result.dart';

Future<BuildResult> build(List<GeneratorApplication> applications) async {
  applications.forEach((element) => print(element.toString()));
  throw UnimplementedError();
}
