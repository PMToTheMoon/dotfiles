import 'dart:io';

import 'package:path/path.dart' as p;

/// Relative path to the cache directory from the root package dir.
const String cacheDir = '.dart_tool/bonemeal';

const String buildCacheDir = '$cacheDir/build';

const String iprBuildCacheDir = 'lib';

const String outputBuildCacheDir = '$buildCacheDir/output';

/// Directory containing automatically generated build entrypoints.
///
/// Files in this directory must be read to do build script invalidation.
const entryPointDir = '$cacheDir/entrypoint';

/// The path to the sdk on the current platform.
final sdkPath = p.dirname(p.dirname(Platform.resolvedExecutable));
