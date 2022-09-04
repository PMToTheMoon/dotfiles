abstract class MetaObject {
  Future<void> write();
}

class MultiChildMetaObject implements MetaObject {
  final List<MetaObject> children;

  Future<void> write() async {}
}

class MetaObjectSeed implements MetaObject {
  Future<void> write() {}

  MetaObject build() {}
}
