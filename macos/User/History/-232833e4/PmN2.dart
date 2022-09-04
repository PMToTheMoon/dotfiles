part of 'yaml.dart';

class YamlWithHeader {
  final YamlHeader header;
  final Map<String, dynamic> body;
}

class YamlHeader {
  final String generator;
  final String version;
}
