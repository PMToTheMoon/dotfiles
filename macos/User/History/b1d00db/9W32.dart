class PackageNotFoundException implements Exception {
  final String name;

  PackageNotFoundException(this.name);

  @override
  String toString() => 'PackageNotFoundException: $name';
}
