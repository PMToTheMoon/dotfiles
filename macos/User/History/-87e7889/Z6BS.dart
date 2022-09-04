@JsonSerializable()
class TokenBody {
  const TokenBody();

  factory TokenBody.fromJson(Map<String, dynamic> json) =>
      _$TokenBodyFromJson(json);

  Map<String, dynamic> toJson() => _$TokenBodyToJson(this);
}
