import 'package:code_builder/code_builder.dart' show DartEmitter, Allocator;
import 'package:code_builder/src/specs/reference.dart';
import 'package:code_builder/src/specs/directive.dart';

import 'dart.dart';

class MyAllocator implements Allocator {
  MyAllocator();

  @override
  String allocate(Reference reference) {
    final rawUrl = reference;
    throw UnimplementedError();
  }

  @override
  // TODO: implement imports
  Iterable<Directive> get imports => throw UnimplementedError();
}

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
