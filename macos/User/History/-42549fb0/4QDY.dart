part of 'yaml.dart';

class YamlWithHeader {
  YamlWithHeader({
    required this.header,
    required this.body,
  });
  final YamlHeader header;
  final Map<String, dynamic> body;
}

// TODO: checked yaml
class YamlHeader {
  YamlHeader({
    required this.generator,
  });
  final String generator;
}
