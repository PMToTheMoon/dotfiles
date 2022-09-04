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
  Library({
    required this.children,
  }):

  final List<MetaObject> children;

  @override
  void write(WriteContext context) {
    context.visitChildren((element) {});
  }
}
