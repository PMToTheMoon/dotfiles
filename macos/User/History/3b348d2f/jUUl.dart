export 'model/model_generator.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:path/path.dart';
import 'package:built_collection/built_collection.dart';

part 'dart_generator.dart';

class Asset {
  const Asset({
    required this.path,
    required this.content,
  });
  final String path;
  final String content;
}

abstract class AssetContentBuilder {
  String build();
}

class BuildStep {
  BuildStep() : _outputs = PathMap<AssetContentBuilder>();

  final PathMap<AssetContentBuilder> _outputs;

  AssetContentBuilder asset(path,
          {required AssetContentBuilder Function() ifAbsent}) =>
      _outputs.putIfAbsent(path, ifAbsent);

  DartAssetBuilder dartAsset(path) =>
      _outputs.putIfAbsent(path, () => DartAssetBuilder()) as DartAssetBuilder;

  List<Asset> build() => _outputs.entries
      .map((e) => Asset(path: e.key ?? "/", content: e.value.build()))
      .toList();
}

abstract class Generator {
  void generate(BuildStep step);
}

void test(BuildStep step) {
  final asset = step.dartAsset("e/e.dart");
  asset.directives.add(Directive.import("url"));
}
