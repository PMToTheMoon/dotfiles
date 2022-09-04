import 'dart:io';
import 'package:path/path.dart' as p;

Future<void> clearIprTarget() async {}

/// Remove all files from dir that match a file inside source
Future<void> subtractSourceToTargetDir(String source, String dir) async {
  if (p.isAbsolute(source))
    throw UnsupportedError("Absolute path for source isn't supported");
  final sourceDir = Directory(source);
  if (await sourceDir.exists() == false) return;
  await for (final file in sourceDir.list(recursive: true)) {
    final path = file.path;
  }
}
