import 'package:bonemeal/src/workspace/asset.dart';

import 'framework.dart';

class DartProject extends Seed {
  DartProject({super.key});

  @override
  MetaObject build() {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class Library extends Asset {
  const Library({
    required super.name,
    super.key,
    this.children = const [],
  });

  final List<MetaObject> children;

  @override
  void write(WriteContext context) {
    context.visitChildren((element) {});
  }

  @override
  void write(WriteContext context) {
    context.visitChildren((element) {});
  }
}
