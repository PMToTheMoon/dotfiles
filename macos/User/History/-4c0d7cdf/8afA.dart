import 'package:glob/glob.dart';

const List<String> defaultNonRootVisibleAssets = [
  'CHANGELOG*',
  'lib/**',
  'bin/**',
  'LICENSE*',
  'pubspec.yaml',
  'README*',
];

/// Describes a set of files that should be built.
class BuildFilter {
  /// The package name glob that files must live under in order to match.
  final Glob _package;

  /// A glob for files under [_package] that must match.
  final Glob _path;

  BuildFilter(this._package, this._path);

  /// Builds a [BuildFilter] from a command line argument.
  ///
  /// Both relative paths and package: uris are supported. Relative
  /// paths are treated as relative to the [rootPackage].
  ///
  /// Globs are supported in package names and paths.
  factory BuildFilter.fromArg(String arg, String rootPackage) {
    var uri = Uri.parse(arg);
    if (uri.scheme == 'package') {
      var package = uri.pathSegments.first;
      var glob = Glob(p.url.joinAll([
        'lib',
        ...uri.pathSegments.skip(1),
      ]));
      return BuildFilter(Glob(package), glob);
    } else if (uri.scheme.isEmpty) {
      return BuildFilter(Glob(rootPackage), Glob(uri.path));
    } else {
      throw FormatException('Unsupported scheme ${uri.scheme}', uri);
    }
  }
