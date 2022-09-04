import 'dart:io';
import 'package:bonemeal_core/src/constants.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as p;

// final _log = Logger('Cleaning');

// @override
// Future<void> clean() async {
//   // await cleanIprExportDir();
//   // _log.fine('Successfully cleaned ipr export dir');
//   await cleanOutputExportDir();
//   _log.fine('Successfully cleaned target dir');
//   await cleanCache();
//   _log.fine('Successfully cleaned cache dir');
// }

// Future<void> cleanIprExportDir() =>
//     subtractSourceToTargetDir(iprBuildCacheDir, iprExportDir);

// Future<void> cleanOutputExportDir() async {
//   // final packageGraph = await PackageGraph.forThisPackage();
//   // final options = await BuildOptions.create(
//   //   packageGraph,
//   // );
//   final outputDir = options.config.target;
//   if (outputDir != null) {
//     await subtractSourceToTargetDir(
//       outputBuildCacheDir,
//       outputDir,
//     );
//   } else {
//     _log.info("Nothing to clean for output target: target isn't "
//         'defined in bonemeal config');
//   }
// }