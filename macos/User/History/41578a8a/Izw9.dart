class ConfigFileNotFound implements Exception {
  const ConfigFileNotFound(this.path);

  final String path;

  @override
  String toString() => 'bonemeal.yaml not found at path $path';
}

class InvalidConfigFile implements Exception {
  const InvalidConfigFile(this.message);

  final String message;

  @override
  String toString() => 'bonemeal.yaml file is invalid';
}
