import 'dart:io';

/// Relative path to the cache directory from the root package dir.
const String cacheDir = '.dart_tool/bonemeal';

const String buildCacheDir = '$cacheDir/build';

const String iprBuildCacheDir = '$buildCacheDir/ipr';

const String outputBuildCacheDir = '$buildCacheDir/output';

// relative path root for all exported ipr assets
const String iprBuildDir = 'lib/context';

/// Directory containing automatically generated build entrypoints.
///
/// Files in this directory must be read to do build script invalidation.
const entryPointDir = '$cacheDir/entrypoint';

/// The path to the sdk on the current platform.
final sdkPath = p.dirname(p.dirname(Platform.resolvedExecutable));
