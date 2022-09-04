part of 'yaml.dart';

@JsonSerializable()
class YamlWithHeader {
  YamlWithHeader({
    required this.header,
    required this.body,
  });
  final YamlHeader header;
  final Map<String, dynamic> body;

  factory YamlWithHeader.fromJson(Map json) => _$YamlWithHeaderFromJson(json);
}

@JsonSerializable()
class YamlHeader {
  YamlHeader({
    required this.type,
  });
  final String type;

  factory YamlHeader.fromJson(Map json) => _$YamlHeaderFromJson(json);
}
