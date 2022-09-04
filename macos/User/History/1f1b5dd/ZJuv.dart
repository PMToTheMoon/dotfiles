import 'dart:async';

import 'package:bonemeal_core/src/asset/id.dart';
import 'package:bonemeal_core/src/asset/reader.dart';
import 'package:bonemeal_core/src/asset/writer.dart';

import 'slot.dart';

/// All asset written with BuildContext use a relative path
/// The root of the path is determined by the source object
abstract class BuildContext extends PathProvidingAssetReader
    implements AssetWriter {
  BuildContext({
    required this.iprPackage,
    required this.outputPackage,
    required this.source,
  });

  final AssetId source;

  final String iprPackage;
  final String outputPackage;

  /// Create an output sset at relative [path] and write [content] inside of it.
  Future<void> output(String path, String content);

  /// Create an ipr asset at relative [path] and write [content] inside of it.
  Future<void> ipr(String path, String content);

  BuildContext createChildContext({String? newRoot});

  FutureOr<T> buildMetaObjectFromSlot<T>(MetaObjectSlot slot);
}
