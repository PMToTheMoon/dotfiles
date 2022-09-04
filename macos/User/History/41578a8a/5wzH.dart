class ConfigFileNotFound implements Exception {
  const ConfigFileNotFound(this.path);

  final String path;

  String toString() => 'bonemeal.yaml not found at path $path';
}

class InvalidConfigFile implements Exception {
  const InvalidConfigFile(this.path);

  final String path;

  String toString() => 'bonemeal.yaml not found at path $path';
}
