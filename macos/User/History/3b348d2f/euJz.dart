export 'model/model_generator.dart';
import 'package:bonemeal/bonemeal.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:grinder/grinder.dart';
import 'package:path/path.dart';

part 'dart_generator.dart';

// class Asset {
//   Asset(AssetBuilder Function(AssetBuilder) builder)
//       : content = builder().build();
//   String path;
//   String content;
// }

abstract class AssetBuilder {
  String build();
}

typedef GeneratorOutput = PathMap<AssetBuilder>;

class BuildStep {
  BuildStep() : _outputs = PathMap<AssetBuilder>();

  final GeneratorOutput _outputs;

  AssetBuilder asset(path, {required AssetBuilder ifAbsent}) => _outputs.putIfAbsent(path, () => T())

abstract class Generator {
  void generate(BuildStep step);
}

void test(BuildStep step) {
  step.output(DartAsset(($) => $));
}
