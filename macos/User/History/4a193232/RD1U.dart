import 'package:json_annotation/json_annotation.dart';

part 'bonemeal_config.g.dart';

@JsonSerializable()
class BonemealConfig {
  const BonemealConfig({
    required this.outputDir,
  });

  final String outputDir;

  factory BonemealConfig.fromJson(Map<String, dynamic> json) =>
      _$BonemealConfigFromJson(json);
}
