import 'package:bonemeal/bonemeal.dart';
import 'package:code_builder/code_builder.dart'
    show DartEmitter, Allocator, Reference;

class MetaObjectReference extends Reference {
  MetaObjectReference(super.symbol, this.key);

  final Key key;
}

mixin Referable on MetaObject {
  String get symbol;

  MetaObjectReference get ref => MetaObjectReference(symbol, key ?? Key(this));
}

class MyAllocator implements Allocator {
  MyAllocator();

  @override
  String allocate(Reference reference) {
    final rawUrl = reference;

    refer(Bloc.blocCLass);
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
