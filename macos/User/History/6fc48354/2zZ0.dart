import 'id.dart';

class AssetNotFoundException implements Exception {
  final AssetId assetId;

  AssetNotFoundException(this.assetId);

  @override
  String toString() => 'AssetNotFoundException: $assetId';
}

class InvalidOutputException implements Exception {
  final AssetId assetId;
  final String message;

  InvalidOutputException(this.assetId, this.message);

  @override
  String toString() => 'InvalidOutputException: $assetId\n$message';
}
