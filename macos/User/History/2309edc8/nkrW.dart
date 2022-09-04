import 'package:bloc/bloc.dart';

abstract class MetaObject {
  Future<void> write();
}

class MultiChildMetaObject implements MetaObject {
  MultiChildMetaObject(this.children);

  final List<MetaObject> children;

  Future<void> write() async {
    for (final child in children) {
      child.write();
    }
  }
}

class MetaObjectSeed implements MetaObject {
  Future<void> write() {}

  MetaObject build() {}
}
