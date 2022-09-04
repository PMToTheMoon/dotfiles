class Unauthorized implements Exception {
  const Unauthorized([this.message]);

  final String? message;
}

class Forbidden implements Exception {}
