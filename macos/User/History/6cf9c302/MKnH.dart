import 'dart:io';
import 'package:bonemeal_runner/src/utils/constants.dart';
import 'package:path/path.dart' as p;

Future<void> cleanIprExportDir() =>
    subtractSourceToTargetDir(iprBuildCacheDir, iprExportDir);

/// Remove all files from dir that match a file inside source
Future<void> subtractSourceToTargetDir(String source, String target) async {
  if (p.isAbsolute(source)) {
    throw UnsupportedError("Absolute path for source isn't supported");
  }
  final sourceDir = Directory(source);
  final targetDir = Directory(target);
  if (await sourceDir.exists() == false || await targetDir.exists() == false) {
    return;
  }
  await for (final file in sourceDir.list(recursive: true)) {
    final path = file.path;
  }
}
