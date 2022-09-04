import 'package:bonemeal/src/asset/reader.dart';
import 'package:bonemeal/src/asset/writer.dart';

abstract class BuildStep extends AssetReader implements AssetWriter {
  Set<AssetId> get inputs;
}
