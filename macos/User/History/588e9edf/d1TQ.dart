import 'package:bonemeal_runner/src/generate/build.dart';
import 'package:bonemeal_runner/src/logging/logging.dart';
import 'package:bonemeal_runner/src/package_graph/apply_generators.dart';

Future<int> run(
    List<String> args, List<GeneratorApplication> applications) async {
  initializeLogger();

  final result = await build();
  if (result.isSuccess) {
    return 0;
  }
  return 1;
}
