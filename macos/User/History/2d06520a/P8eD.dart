// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
import 'package:path/path.dart' as p;

enum AssetType { ipr, output, shared }

/// Identifies an asset within a package.
class AssetId implements Comparable<AssetId> {
  /// The type of asset.
  final AssetType type;

  /// The path to the asset relative to the root directory of [type].
  ///
  /// Source (i.e. read from disk) and generated (i.e. the output of a
  /// `Builder`) assets all have paths. Even intermediate assets that are
  /// generated and then consumed by later transformations will still have a
  /// path used to identify it.
  ///
  /// Asset paths always use forward slashes as path separators, regardless of
  /// the host platform. Asset paths will always be within their package, that
  /// is they will never contain "../".
  final String path;

  /// Splits [path] into its components.
  List<String> get pathSegments => p.url.split(path);

  /// The file extension of the asset, if it has one, including the ".".
  String get extension => p.extension(path);

  /// Creates a new [AssetId] at [path] within [type].
  ///
  /// The [path] will be normalized: any backslashes will be replaced with
  /// forward slashes (regardless of host OS) and "." and ".." will be removed
  /// where possible.
  AssetId(this.type, String path) : path = _normalizePath(path);

  AssetId.package(String path)
      : type = AssetType.package,
        path = _normalizePath(path);

  AssetId.input(String path)
      : type = AssetType.input,
        path = _normalizePath(path);

  AssetId.ipr(String path)
      : type = AssetType.ipr,
        path = _normalizePath(path);

  AssetId.output(String path)
      : type = AssetType.output,
        path = _normalizePath(path);

  bool get isPackage => type == AssetType.package;
  bool get isInput => type == AssetType.input;
  bool get isIpr => type == AssetType.ipr;
  bool get isOutput => type == AssetType.output;
  bool get isGenerated => isOutput || isIpr;

  /// Creates a new [AssetId] from an [uri] String.
  ///
  /// This gracefully handles `package:` or `asset:` URIs.
  ///
  /// Resolve a `package:` URI when creating an [AssetId] from an `import` or
  /// `export` directive pointing to a package's _lib_ directory:
  /// ```dart
  /// AssetId assetOfDirective(UriReferencedElement element) {
  ///   return new AssetId.resolve(element.uri);
  /// }
  /// ```
  ///
  /// When resolving a relative URI with no scheme, specifying the origin asset
  /// ([from]) - otherwise an [ArgumentError] will be thrown.
  /// ```dart
  /// AssetId assetOfDirective(AssetId origin, UriReferencedElement element) {
  ///   return new AssetId.resolve(element.uri, from: origin);
  /// }
  /// ```
  ///
  /// `asset:` uris have the format '$package/$path', including the top level
  /// directory.
  factory AssetId.resolve(Uri uri, {AssetId? from}) {
    var resolved = uri.hasScheme
        ? uri
        : from != null
            ? from.uri.resolveUri(uri)
            : (throw ArgumentError.value(from, 'from',
                'An AssetId "from" must be specified to resolve a relative URI'));
    if (resolved.scheme == 'package') {
      return AssetId.package(
          p.url.join('lib', p.url.joinAll(resolved.pathSegments.skip(1))));
    } else if (resolved.scheme == 'asset') {
      return AssetId.input(p.url.joinAll(resolved.pathSegments.skip(1)));
    }
    throw UnsupportedError(
        'Cannot resolve $uri; only "package" and "asset" schemes supported');
  }

  /// Parses an [AssetId] string of the form "package|path/to/asset.txt".
  ///
  /// The [path] will be normalized: any backslashes will be replaced with
  /// forward slashes (regardless of host OS) and "." and ".." will be removed
  /// where possible.
  factory AssetId.parse(String description) {
    var parts = description.split('|');
    if (parts.length != 2) {
      throw FormatException('Could not parse "$description".');
    }

    if (parts[0].isEmpty) {
      throw FormatException(
          'Cannot have empty package name in "$description".');
    }

    if (parts[1].isEmpty) {
      throw FormatException('Cannot have empty path in "$description".');
    }

    return AssetId(AssetType.values.byName(parts[0]), parts[1]);
  }

  /// Return an new AssetId with pathSegment appended to path
  AssetId append(String pathSegment) {
    if (path.startsWith(pathSegment)) return AssetId(type, pathSegment);

    return AssetId(type, p.join(p.dirname(path), pathSegment));
  }

  /// A `package:` URI suitable for use directly with other systems if this
  /// asset is under it's package's `lib/` directory, else an `asset:` URI
  /// suitable for use within build tools.
  late final Uri uri = _constructUri(this);

  /// Deserializes an [AssetId] from [data], which must be the result of
  /// calling [serialize] on an existing [AssetId].
  AssetId.deserialize(List<dynamic> data)
      : type = AssetType.values.byName(data[0] as String),
        path = data[1] as String;

  /// Returns `true` if [other] is an [AssetId] with the same package and path.
  @override
  bool operator ==(Object other) =>
      other is AssetId && type == other.type && path == other.path;

  @override
  int get hashCode => type.hashCode ^ path.hashCode;

  @override
  int compareTo(AssetId other) {
    var packageComp = type.compareTo(other.type);
    if (packageComp != 0) return packageComp;
    return path.compareTo(other.path);
  }

  /// Returns a new [AssetId] with the same [type] as this one and with the
  /// [path] extended to include [extension].
  AssetId addExtension(String extension) => AssetId(type, '$path$extension');

  /// Returns a new [AssetId] with the same [type] and [path] as this one
  /// but with file extension [newExtension].
  AssetId changeExtension(String newExtension) =>
      AssetId(type, p.withoutExtension(path) + newExtension);

  @override
  String toString() => '$type|$path';

  /// Serializes this [AssetId] to an object that can be sent across isolates
  /// and passed to [AssetId.deserialize].
  Object serialize() => [type, path];
}

String _normalizePath(String path) {
  if (p.isAbsolute(path)) {
    throw ArgumentError.value(path, 'Asset paths must be relative.');
  }

  // Normalize path separators so that they are always "/" in the AssetID.
  path = path.replaceAll(r'\', '/');

  // Collapse "." and "..".
  final collapsed = p.posix.normalize(path);
  if (collapsed.startsWith('../')) {
    throw ArgumentError.value(
        path, 'Asset paths may not reach outside the package.');
  }
  return collapsed;
}

Uri _constructUri(AssetId id) {
  final originalSegments = id.pathSegments;
  final isLib = originalSegments.first == 'lib';
  final scheme = isLib ? 'package' : 'asset';
  final pathSegments = isLib ? originalSegments.skip(1) : originalSegments;
  return Uri(scheme: scheme, pathSegments: pathSegments);
}
