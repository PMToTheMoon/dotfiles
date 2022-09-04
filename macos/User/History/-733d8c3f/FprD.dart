import 'package:path/path.dart' as p;

String toPackagePath(String package, String path) {
  final segments = p.split(path);
  if (segments.first == 'lib') {
    final packagePath = p.joinAll(segments.skip(1));
    return 'package:$package/$packagePath';
  }
  return 'package:$package/$path';
}

String normalizedPackagePath(String currentPackage, String path) {
  if (path.contains(r'$package')) {
    path.replaceFirst(r'$package', currentPackage);
  }
}
