import 'package:bloc/bloc.dart';

abstract class MetaObject {
  Future<void> write();
}

class MultiChildMetaObject implements MetaObject {
  MultiChildMetaObject(this.children);

  final List<MetaObject> children;

  Future<void> write() async {
    for (final child in children) {
      await child.write();
    }
  }
}

class MetaObjectSeed implements MetaObject {
  Future<void> write() async {
    final object = build();
    await object.write();
  }

  MetaObject build() {}
}
