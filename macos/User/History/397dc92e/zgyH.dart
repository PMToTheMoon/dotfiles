import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:built_collection/built_collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

export 'id.dart';

part 'dart_asset_builder.dart';
part 'yaml_asset.dart';

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
