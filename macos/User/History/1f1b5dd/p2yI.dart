import 'package:bonemeal_core/src/asset/reader.dart';
import 'package:bonemeal_core/src/asset/writer.dart';

abstract class BuildContext extends AssetReader implements AssetWriter {
  BuildContext({
    required this.source,
  });
  final AssetId source;
}
