abstract class BuildContext extends AssetReader implements AssetWriter {
  BuildContext({
    required this.source,
  });
  final AssetId source;
}
