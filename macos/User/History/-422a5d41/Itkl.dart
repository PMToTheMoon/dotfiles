/// Relative path to the cache directory from the root package dir.
const String cacheDir = '.bonemeal';

/// Directory containing automatically generated build entrypoints.
///
/// Files in this directory must be read to do build script invalidation.
const entryPointDir = '$cacheDir/entrypoint';
