import 'dart:async';

import 'package:bonemeal_core/bonemeal_core.dart';

abstract class BuildStep extends AssetReader implements AssetWriter {
  BuildStep({
    required this.iprPackage,
    required this.outputPackage,
  });

  final String iprPackage;

  final String outputPackage;

  Set<AssetId> get inputs;

  FutureOr<void> buildMetaObjectFromData<T>(
    MetaObject<T> object,
    AssetId source,
    T data,
  );

  FutureOr<void> buildMetaObjectFromAsset<T>(
    MetaObject<T> object,
    AssetId source,
  );
}
