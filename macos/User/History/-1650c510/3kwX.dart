import 'dart.dart';

class DartEmitterVisitor {
  void call(MetaObject object) {}

  void visitLibrary(Library library) {
    final spec = library.build(specs);
    DartEmitter();
  }
}
