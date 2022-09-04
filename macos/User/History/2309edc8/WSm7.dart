abstract class MetaObject {
  Future<void> write();
}

class MultiChildMetaObject implements MetaObject {
  MultiChildMetaObject(this.children);

  final List<MetaObject> children;

  Future<void> write() async {}
}

class MetaObjectSeed implements MetaObject {
  Future<void> write() {}

  MetaObject build() {}
}
