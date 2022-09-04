import 'package:bonemeal/bonemeal.dart';
import 'package:code_builder/code_builder.dart'
    show DartEmitter, Allocator, Reference, Directive;
import 'package:analyzer/analyzer.dart';

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

  final Set<Directive> _directives = {};

  @override
  String allocate(Reference reference) {
    if (reference is MetaObjectReference) {}
    throw UnimplementedError();
  }

  @override
  Iterable<Directive> get imports => _directives;
}

final _formatter = DartFormat();

DartEmitter _libraryEmitter(MetaObject library) {
  return DartEmitter(
    allocator: LibraryAllocator(library),
    useNullSafetySyntax: true,
    orderDirectives: true,
  );
}

class DartEmitterVisitor {
  void call(MetaObject object) {}

  void visitLibrary(Library library) {
    final spec = library.build();
    final emitter = _libraryEmitter(library);
    final code = spec.accept(emitter).toString();
  }
}
