export 'models_generator.dart';
import 'dart:async';

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
  const AssetContentBuilder();
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
      .map((entry) => Asset(path: entry.key!, content: entry.value.build()))
      .toList();
}

class BuildStepContext {}

abstract class Generator {
  const Generator();
  FutureOr<void> generate(BuildStep step);
}
