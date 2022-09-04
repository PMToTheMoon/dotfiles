import 'package:freezed_annotation/freezed_annotation.dart';

part 'yaml_asset.freezed.dart';
part 'yaml_asset.g.dart';

@freezed
class YamlAsset with _$YamlAsset {
  const factory YamlAsset({
    required String version,
    required String generator,
  }) = _YamlAsset;
}
