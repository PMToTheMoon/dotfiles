import 'dart:async';

import 'package:bonemeal_yaml/bonemeal_yaml.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fetch_sm.g.dart';

@JsonSerializable()
class MetaFetchSmbData {
  const MetaFetchSmbData();

  final String subject;

  final _Source source;

  final _Data data;

  factory MetaFetchSmbData.fromJson(Map json) =>
      _$MetaFetchSmbDataFromJson(json);
}

class _Source {
  const _Source({
    required this.type,
    required this.fetchFunction,
  });

  final String type;

  final String fetchFunction;

  factory _Source.fromJson(Map json) => _$SourceFromJson(json);
}

class MetaFetchSmb extends YamlMetaObject<MetaFetchSmbData> {
  @override
  FutureOr<void> build(BuildContext context, MetaFetchSmbData data) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
