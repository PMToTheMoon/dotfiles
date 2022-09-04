import 'package:bonemeal/bonemeal.dart';
import 'package:code_builder/code_builder.dart'
    show DartEmitter, Allocator, Reference, Directive;

class MetaObjectReference extends Reference {
  MetaObjectReference(super.symbol, this.key);

  final Key key;
}

mixin Referable on MetaObject {
  String get symbol;

  MetaObjectReference get ref => MetaObjectReference(symbol, key ?? Key(this));
}

class LibraryAllocator implements Allocator {
  LibraryAllocator(this.library);

  final MetaObject library;

  List<Directive> _directives;

  @override
  String allocate(Reference reference) {
    if (reference is MetaObjectReference) {}
    throw UnimplementedError();
  }

  @override
  Iterable<Directive> get imports => _directives;
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
