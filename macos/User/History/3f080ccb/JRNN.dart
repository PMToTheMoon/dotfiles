import 'dart:async';

import 'package:bonemeal_core/bonemeal_core.dart';

abstract class BuildStep extends AssetReader implements AssetWriter {
  BuildStep({required this.package});
  Set<AssetId> get inputs;

  final String package;

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
