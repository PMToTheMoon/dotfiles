@JsonSerializable()
class BonemealConfig {
  const BonemealConfig();

  factory BonemealConfig.fromJson(Map<String, dynamic> json) =>
      _$BonemealConfigFromJson(json);

  Map<String, dynamic> toJson() => _$BonemealConfiToJson(this);
}
