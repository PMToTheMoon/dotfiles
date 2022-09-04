import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class BonemealConfig {
  const BonemealConfig();

  final String outputDir;

  factory BonemealConfig.fromJson(Map<String, dynamic> json) =>
      _$BonemealConfigFromJson(json);

  Map<String, dynamic> toJson() => _$BonemealConfiToJson(this);
}
