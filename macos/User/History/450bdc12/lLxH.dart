import 'id.dart';
import 'writer.dart';

abstract class RunnerAssetWriter implements AssetWriter {
  Future delete(AssetId id);
}
