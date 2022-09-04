import 'package:bonemeal_runner/src/generate/build.dart';
import 'package:bonemeal_runner/src/generate/build_result.dart';
import 'package:bonemeal_runner/src/logging/logging.dart';
import 'package:bonemeal_runner/src/package_graph/apply_generators.dart';
import 'package:logging/logging.dart';

/// A common entry point to parse command line arguments and build or serve with
/// [generators].
///
/// Returns the exit code that should be set when the calling process exits. `0`
/// implies success.
Future<int> run(
  List<String> args,
  List<GeneratorApplication> generators,
) async {
  initializeLogger();
  print("run build...");
  Logger("TEST").info("test");
  final result = await build(generators);
  if (result.status == BuildStatus.success) {
    return 0;
  }
  return 1;
}
