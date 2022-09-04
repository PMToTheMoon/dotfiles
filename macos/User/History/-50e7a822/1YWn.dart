import 'package:bonemeal/src/asset/id.dart';
import 'dart:convert';

import 'package:bonemeal/src/asset/reader.dart';
import 'package:bonemeal/src/asset/writer.dart';
import 'package:glob/glob.dart';
import 'package:crypto/crypto.dart';

class BuildStep implements AssetReader, AssetWriter {
  @override
  Future<bool> canRead(AssetId id) {
    // TODO: implement canRead
    throw UnimplementedError();
  }

  @override
  Future<Digest> digest(AssetId id) {
    // TODO: implement digest
    throw UnimplementedError();
  }

  @override
  Stream<AssetId> findAssets(Glob glob) {
    // TODO: implement findAssets
    throw UnimplementedError();
  }

  @override
  Future<List<int>> readAsBytes(AssetId id) {
    // TODO: implement readAsBytes
    throw UnimplementedError();
  }

  @override
  Future<String> readAsString(AssetId id, {Encoding encoding = utf8}) {
    // TODO: implement readAsString
    throw UnimplementedError();
  }

  @override
  Future<void> writeAsBytes(AssetId id, List<int> bytes) {
    // TODO: implement writeAsBytes
    throw UnimplementedError();
  }

  @override
  Future<void> writeAsString(AssetId id, String contents,
      {Encoding encoding = utf8}) {
    // TODO: implement writeAsString
    throw UnimplementedError();
  }
}
