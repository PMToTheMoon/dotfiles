import 'dart:async';
import 'package:json_annotation/json_annotation.dart';

import 'package:bonemeal_yaml/bonemeal_yaml.dart';

part 'page_generator.g.dart';

class PageGenerator extends YamlGenerator<MetaPage, MetaPageData> {
  PageGenerator() : super(MetaPageData.fromJson);
}

class MetaPage extends YamlMetaObject<MetaPageData> {
  const MetaPage();

  @override
  FutureOr<void> build(BuildContext context, MetaPageData data) {}
}

@JsonSerializable()
class MetaPageData {
  const MetaPageData();

  factory MetaPageData.fromJson(Map json) => _$PageFromJson(json);
}
