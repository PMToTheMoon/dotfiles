part of 'yaml.dart';

class YamlWithHeader {
  final YamlHeader header;
  final Map<String, dynamic> body;
}

// TODO: checked yaml
class YamlHeader {
  YamlHeader({
    required this.generator,
    required this.version,
  });
  final String generator;
  final String version;
}
