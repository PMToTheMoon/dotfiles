export 'model/model_generator.dart';
import 'package:bonemeal/bonemeal.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:grinder/grinder.dart';
import 'package:path/path.dart';

part 'dart_generator.dart';

abstract class AssetBuilder {
  String build();
}

class BuildStep {
  BuildStep() : _outputs = PathMap<AssetBuilder>();

  final PathMap<AssetBuilder> _outputs;

  AssetBuilder asset(path, {required AssetBuilder Function() ifAbsent}) =>
      _outputs.putIfAbsent(path, ifAbsent);

  DartAssetBuilder dartAsset(path) =>
      _outputs.putIfAbsent(path, () => DartAssetBuilder()) as DartAssetBuilder;
}

abstract class Generator {
  void generate(BuildStep step);
}

void test(BuildStep step) {
  step.output(DartAsset(($) => $));
}
