import 'dart:async';

import 'package:bonemeal_yaml/bonemeal_yaml.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fetch_sm.g.dart';

@JsonSerializable()
class MetaFetchSmbData {
  const MetaFetchSmbData();

  final String subject;

  factory MetaFetchSmbData.fromJson(Map json) =>
      _$MetaFetchSmbDataFromJson(json);
}

class MetaFetchSmb extends YamlMetaObject<MetaFetchSmbData> {
  @override
  FutureOr<void> build(BuildContext context, MetaFetchSmbData data) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
