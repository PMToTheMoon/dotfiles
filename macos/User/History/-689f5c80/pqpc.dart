import 'package:bonemeal_core/src/asset/id.dart';
import 'package:bonemeal_core/src/asset/reader.dart';
import 'package:bonemeal_core/src/asset/writer.dart';

abstract class BuildStep extends AssetReader implements AssetWriter {
  Set<AssetId> get inputs;
}
