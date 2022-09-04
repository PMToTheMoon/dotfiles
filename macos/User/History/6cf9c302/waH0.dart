import 'dart:io';
import 'package:bonemeal_runner/src/utils/constants.dart';
import 'package:path/path.dart' as p;

Future<void> cleanIprExportDir() =>
    subtractSourceToTargetDir(iprBuildCacheDir, iprExportDir);

/// Remove all files from dir that match a file inside source
Future<void> subtractSourceToTargetDir(String source, String target) async {
  if (p.isAbsolute(source) || p.isAbsolute(target)) {
    throw UnsupportedError("Absolute path aren't supported");
  }
  final sourceDir = Directory(source);
  final targetDir = Directory(target);
  final absoluteTargetPath = p.absolute(target);
  if (await sourceDir.exists() == false || await targetDir.exists() == false) {
    return;
  }
  await for (final sourceFile in sourceDir.list(recursive: true)) {
    final targetFilePath = p.absolute(target, sourceFile.path);
    if (!p.isWithin(absoluteTargetPath, targetFilePath)) {
      throw '$targetFilePath file suppression leads to removing file outside target directory';
    }
  }
}
