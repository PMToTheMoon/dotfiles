import 'package:bonemeal_core/src/asset/id.dart';
import 'package:bonemeal_core/src/asset/reader.dart';
import 'package:bonemeal_core/src/asset/writer.dart';

abstract class BuildContext extends AssetReader implements AssetWriter {
  BuildContext({
    required this.source,
  });

  final AssetId source;

  Future<void> output(String path, String content);
  Future<void> ipr(String path, String content);
}
