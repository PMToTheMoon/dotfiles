import 'dart:async';
import 'package:json_annotation/json_annotation.dart';

import 'package:bonemeal_yaml/bonemeal_yaml.dart';

class PageGenerator extends YamlGenerator<MetaPage> {}

class MetaPage extends YamlMetaObject<Page> {
  const MetaPage();

  @override
  FutureOr<void> build(BuildContext context, Page data) {}
}

@JsonSerializable()
class Page {
  const Page();

  factory Page.fromJson(Map json) => _$PageFromJson(json);
}
