import 'package:bonemeal_core/src/meta_object/context.dart';
import 'dart:async';

import 'package:bonemeal_yaml/bonemeal_yaml.dart';

class PageGenerator extends YamlGenerator<Page> {
  PageGenerator() : super('page');
}

class Page extends YamlMetaObject {
  const Page();

  @override
  FutureOr<void> build(BuildContext context, Map input) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
