import 'dart:io';
import 'package:bonemeal/src/constants.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as p;

final _log = Logger('Cleaning');

@override
Future<void> clean() async {
  // await cleanIprExportDir();
  // _log.fine('Successfully cleaned ipr export dir');
  await cleanOutputExportDir();
  _log.fine('Successfully cleaned target dir');
  await cleanCache();
  _log.fine('Successfully cleaned cache dir');
}

// Future<void> cleanIprExportDir() =>
//     subtractSourceToTargetDir(iprBuildCacheDir, iprExportDir);

Future<void> cleanOutputExportDir() async {
  // final packageGraph = await PackageGraph.forThisPackage();
  // final options = await BuildOptions.create(
  //   packageGraph,
  // );
  final outputDir = options.config.target;
  if (outputDir != null) {
    await subtractSourceToTargetDir(
      outputBuildCacheDir,
      outputDir,
    );
  } else {
    _log.info("Nothing to clean for output target: target isn't "
        'defined in bonemeal config');
  }
}

Future<void> cleanCache() async {
  final dir = Directory(kCacheDir);
  if (await dir.exists()) {
    await dir.delete(recursive: true);
  }
}

/// Remove all files from dir where their file name is contained
/// inside subtract dir (recursive)
Future<void> subtractDir(String dir, String subtract) async {
  if (p.isAbsolute(subtract) || p.isAbsolute(dir)) {
    throw UnsupportedError("Absolute path aren't supported");
  }
  final sourceDir = Directory(subtract);
  final targetDir = Directory(dir);
  final absoluteTargetDirPath = p.absolute(dir);
  if (await sourceDir.exists() == false || await targetDir.exists() == false) {
    return;
  }
  await for (final sourceFile in sourceDir.list(recursive: true)) {
    if (sourceFile is! File) continue;
    final relativeSource = p.relative(sourceFile.path, from: subtract);
    final targetFilePath = p.absolute(dir, relativeSource);
    if (!p.isWithin(absoluteTargetDirPath, targetFilePath)) {
      throw '${sourceFile.path} file suppression leads '
          'to removing file outside target directory';
    }
    final targetFile = File(targetFilePath);
    if (await targetFile.exists() == true) {
      await targetFile.delete();
      await _removeParentDirIfEmpty(absoluteTargetDirPath, targetFilePath);
    }
  }
}

Future<void> _removeParentDirIfEmpty(String root, String path) async {
  var dir = Directory(p.dirname(path));
  var content = await dir.list().toList();
  while (p.isWithin(root, dir.path) && content.isEmpty) {
    await dir.delete();
    dir = dir.parent;
    content = await dir.list().toList();
  }
}
