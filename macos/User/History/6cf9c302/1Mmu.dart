import 'dart:io';
import 'package:path/path.dart' as p;

/// Remove all files from dir that match a file inside source
Future<void> subtractSourceToTargetDir(String source, String dir) async {
  final sourceDir = Directory(source);
  if (await sourceDir.exists() == false) return;
  await for (final file in sourceDir.list(recursive: true)) {
    file.path;
  }
}
