import 'dart:async';

import 'package:bonemeal_yaml/bonemeal_yaml.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fetch_sm.g.dart';

@JsonSerializable()
class MetaFetchBlocData {
  const MetaFetchBlocData();

  // final _Data data;

  factory MetaFetchBlocData.fromJson(Map json) =>
      _$MetaFetchSmbDataFromJson(json);
}

@JsonSerializable()
class _Source {
  const _Source({
    required this.type,
    required this.fetchFunction,
  });

  final String type;

  final String fetchFunction;

  factory _Source.fromJson(Map json) => _$SourceFromJson(json);
}

class MetaFetchSmb extends YamlMetaObject<MetaFetchBlocData> {
  @override
  FutureOr<void> build(BuildContext context, MetaFetchBlocData data) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
