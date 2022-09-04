import 'package:bonemeal_runner/src/package_graph/apply_generators.dart';

/// A common entry point to parse command line arguments and build or serve with
/// [generators].
///
/// Returns the exit code that should be set when the calling process exits. `0`
/// implies success.
Future<int> run(
  List<String> args,
  List<GeneratorApplication> generators,
) async {
  print("run build...");
  return 0;
}
