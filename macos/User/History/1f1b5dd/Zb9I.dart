import 'package:bonemeal_core/src/asset/id.dart';
import 'package:bonemeal_core/src/asset/reader.dart';
import 'package:bonemeal_core/src/asset/writer.dart';

class BuildContext extends AssetReader implements AssetWriter {
  BuildContext({
    required this.source,
  });
  final AssetId source;
}
