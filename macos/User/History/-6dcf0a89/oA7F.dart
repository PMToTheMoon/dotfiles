import 'dart:async';
import 'package:json_annotation/json_annotation.dart';

import 'package:bonemeal_yaml/bonemeal_yaml.dart';

class PageGenerator extends YamlGenerator<MetaPage> {}

class MetaPage extends YamlMetaObject<Page> {
  const MetaPage() : super(Page.fromJson);

  @override
  FutureOr<void> build(BuildContext context, Map input) {
    final page = page.fromJson(input);

    // TODO: implement build
    throw UnimplementedError();
  }
}

@JsonSerializable()
class Page extends YamlMetaObject {
  const Page();

  factory Page fromJson(Map json) => _$PageFromJson(json);
}
