import 'package:path/path.dart' as p;

String toPackagePath(String path) {
  final segments = p.split(path);
  if (segments.first == 'lib/') {}
}
