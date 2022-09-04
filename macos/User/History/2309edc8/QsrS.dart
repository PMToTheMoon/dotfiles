abstract class Meta {
  Future<void> write();
}

class SingleChildMetaWriter implements Meta {
  Future<void> write() {}
}

class MetaObject {
  Future<void> write() {}

  Future<void> build() {}
}
