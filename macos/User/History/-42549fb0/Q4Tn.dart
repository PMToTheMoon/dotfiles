part of 'yaml.dart';

class YamlWithHeader {
  YamlWithHeader({
    required this.header,
    required this.body,
  });
  final YamlHeader header;
  final Map<String, dynamic> body;
}

class YamlHeader {
  YamlHeader({
    required this.type,
    required this.entrypoint,
  });
  final String type;
  final bool entrypoint;
}
