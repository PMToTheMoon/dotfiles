import 'dart:io';
import 'package:bonemeal_runner/src/generate/build_options.dart';
import 'package:bonemeal_runner/src/package_graph/package_graph.dart';
import 'package:bonemeal_runner/src/utils/constants.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as p;

final _log = Logger('Clean');

Future<void> cleanIprExportDir() =>
    subtractSourceToTargetDir(iprBuildCacheDir, iprExportDir);

Future<void> cleanOutputExportDir() async {
  final packageGraph = await PackageGraph.forThisPackage();
  final options = await BuildOptions.create(
    packageGraph,
  );
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

/// Remove all files from dir that match a file inside source
Future<void> subtractSourceToTargetDir(String source, String target) async {
  if (p.isAbsolute(source) || p.isAbsolute(target)) {
    throw UnsupportedError("Absolute path aren't supported");
  }
  final sourceDir = Directory(source);
  final targetDir = Directory(target);
  final absoluteTargetDirPath = p.absolute(target);
  if (await sourceDir.exists() == false || await targetDir.exists() == false) {
    return;
  }
  await for (final sourceFile in sourceDir.list(recursive: true)) {
    if (sourceFile is! File) continue;
    final relativeSource = p.relative(sourceFile.path, from: source);
    final targetFilePath = p.absolute(target, relativeSource);
    if (!p.isWithin(absoluteTargetDirPath, targetFilePath)) {
      throw '${sourceFile.path} file suppression leads '
          'to removing file outside target directory';
    }
    final targetFile = File(targetFilePath);
    if (await targetFile.exists() == true) {
      await targetFile.delete();
    }
  }
}

Future<void> _removeParentDirIfEmpty(String root, String path) async {
  var dir = Directory(p.basename(path));
  var content = await dir.list();
  while (p.isWithin(root, dir.path))
}