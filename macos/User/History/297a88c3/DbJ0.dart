class InvalidConfigException implements Exception {
  const InvalidConfigException(this.message);

  final String message;

  @override
  String toString() => message;
}
