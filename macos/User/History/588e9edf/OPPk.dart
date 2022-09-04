import 'package:bonemeal_runner/src/build/build.dart';
import 'package:bonemeal_runner/src/logging/logging.dart';

Future<int> run(List<String> args) async {
  initializeLogger();

  final result = await build();
  if (result.isSuccess) {
    return 0;
  }
  return 1;
}
