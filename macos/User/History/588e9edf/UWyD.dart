import 'package:bonemeal_runner/src/generate/build.dart';
import 'package:bonemeal_runner/src/logging/logging.dart';
import 'package:bonemeal_runner/src/generator/apply.dart';

Future<int> run(
  List<String> args,
  List<GeneratorApplication> applications,
) async {
  initializeLogger();

  print("test");

  final result = await build(applications);
  if (result.isSuccess) {
    return 0;
  }
  return 1;
}
