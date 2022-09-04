import 'package:code_builder/code_builder.dart';

import 'dart.dart';

final emitter = DartEmitter();

class DartEmitterVisitor {
  void call(MetaObject object) {}

  void visitLibrary(Library library) {
    final spec = library.build(specs);
    DartEmitter();
  }
}
