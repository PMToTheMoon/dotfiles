export 'model/model_generator.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:path/path.dart';
import 'package:built_collection/built_collection.dart';

part 'dart_generator.dart';

class Asset {
  final String path;
  final String content;
}

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
  final asset = step.dartAsset("e/e.dart");
  asset.directives.add(Directive.import("url"));
}
