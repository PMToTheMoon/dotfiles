import 'package:bonemeal_runner/src/generate/build.dart';
import 'package:bonemeal_runner/src/logging/logging.dart';
import 'package:bonemeal_runner/src/generator/apply.dart';
import 'package:logging/logging.dart';

Future<int> run(
  List<String> args,
  List<GeneratorApplication> applications,
) async {
  initializeLogger();

  Logger("test").fine("jsp pourquoi mais bon");

  final result = await build(applications);
  if (result.isSuccess) {
    return 0;
  }
  return 1;
}
