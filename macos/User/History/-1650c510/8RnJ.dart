import 'package:code_builder/code_builder.dart' show DartEmitter;

import 'dart.dart';

final emitter = DartEmitter(
  orderDirectives: true,
  useNullSafetySyntax: true,
);

class DartEmitterVisitor {
  void call(MetaObject object) {}

  void visitLibrary(Library library) {
    final spec = library.build(specs);
    DartEmitter();
  }
}
