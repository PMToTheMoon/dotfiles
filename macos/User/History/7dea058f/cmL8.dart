import 'build_target.dart';

export 'input_set.dart';
export 'build_target.dart';

class BuildConfig {
  BuildConfig({
    required this.buildTargets,
  });

  final Map<String, BuildTarget> buildTargets;
}
