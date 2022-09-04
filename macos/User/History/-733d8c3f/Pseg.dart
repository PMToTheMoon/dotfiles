String toPackagePath(String package, String path) {
  final segments = p.split(path);
  if (segments.first == 'lib') {
    final packagePath = p.joinAll(segments.skip(1));
    return 'package:$package/$packagePath';
  }
  return 'package:$package/$path';
}
