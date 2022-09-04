abstract class Meta {
  Future<void> write();
}

class MultiChildMetaWriter implements Meta {
  final List<Meta> children;

  Future<void> write() async {}
}

class MetaObject {
  Future<void> write() {}

  Future<void> build() {}
}
