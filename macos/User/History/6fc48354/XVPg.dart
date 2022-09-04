import 'id.dart';

class InvalidOutputException implements Exception {
  final AssetId assetId;
  final String message;

  InvalidOutputException(this.assetId, this.message);

  @override
  String toString() => 'InvalidOutputException: $assetId\n$message';
}
