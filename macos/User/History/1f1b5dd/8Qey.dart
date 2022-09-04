import 'package:bonemeal_core/src/asset/id.dart';
import 'package:bonemeal_core/src/asset/reader.dart';
import 'package:bonemeal_core/src/asset/writer.dart';

/// All asset written with BuildContext use a relative path
abstract class BuildContext extends AssetReader implements AssetWriter {
  BuildContext({
    required this.source,
  });

  final AssetId source;

  /// Create an output sset at relative [path] and write [content] inside of it.
  Future<void> output(String path, String content);

  /// Create an ipr asset at relative [path] and write [content] inside of it.
  Future<void> ipr(String path, String content);
}
