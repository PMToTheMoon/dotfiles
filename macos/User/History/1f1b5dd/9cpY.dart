import 'package:bonemeal_core/src/asset/id.dart';
import 'package:bonemeal_core/src/asset/reader.dart';
import 'package:bonemeal_core/src/asset/writer.dart';

abstract class MetaContext extends AssetReader implements AssetWriter {
  MetaContext({
    required this.source,
  });
  final AssetId source;
}
