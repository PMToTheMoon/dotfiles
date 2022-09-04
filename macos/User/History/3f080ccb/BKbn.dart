import 'package:bonemeal_core/bonemeal_core.dart';
import 'package:bonemeal_core/src/meta_object/build_context.dart';

abstract class BuildStep extends AssetReader implements AssetWriter {
  Set<AssetId> get inputs;

  void buildMetaObjectFor(MetaObject object, AssetId id) {
    final context = BuildContext()
    object.build(context);
  }
}
