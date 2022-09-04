import 'package:bonemeal_runner/src/generate/apply_meta_objects.dart';
import 'package:bonemeal_runner/src/generate/build.dart';
import 'package:bonemeal_runner/src/logging/logging.dart';
import 'package:bonemeal_runner/src/generate/apply_generators.dart';

Future<int> run(
  List<String> args,
  List<MetaObjectApplication> metaObjectApplications,
  List<GeneratorApplication> applications,
) async {
  initializeLogger();

  final result = await build(
    applications,
    false, //todo: parse arguments
  );
  if (result.isSuccess) {
    return 0;
  }
  return 1;
}
