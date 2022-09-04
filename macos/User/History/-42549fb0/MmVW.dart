part of 'yaml.dart';

class YamlWithHeader {
  YamlWithHeader({
    required this.header,
    required this.body,
  });
  final YamlHeader header;
  final Map<String, dynamic> body;
}

@JsonSerializable()
class YamlHeader {
  YamlHeader({
    required this.type,
  });
  final String type;

  factory YamlHeader.fromJson(Map json) => _$YamlHeaderFromJson(json);
}
