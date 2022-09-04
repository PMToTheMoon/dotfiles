import 'package:bonemeal_core/bonemeal_core.dart';

abstract class BuildStep extends AssetReader implements AssetWriter {
  Set<AssetId> get inputs;

  void buildMetaObject(MetaObject object) {}
}
