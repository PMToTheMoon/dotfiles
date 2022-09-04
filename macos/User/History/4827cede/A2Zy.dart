class BuildConfigParseException implements Exception {
  final String packageName;
  final dynamic exception;

  BuildConfigParseException(this.packageName, this.exception);
}
