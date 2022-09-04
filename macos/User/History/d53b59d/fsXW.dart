class Unauthorized implements Exception {
  const Unauthorized([String message]);

  final String message;
}

class Forbidden implements Exception {}
