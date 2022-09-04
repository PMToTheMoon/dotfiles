import 'package:bonemeal_core/bonemeal_core.dart';

abstract class BuildStep extends AssetReader implements AssetWriter {
  Set<AssetId> get inputs;

  FutureOr<void> buildMetaObject(MetaObject object, AssetId source);
}
