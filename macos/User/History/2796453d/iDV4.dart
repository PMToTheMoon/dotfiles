import 'framework.dart';

class DartProjectVisitor {
  void call(MetaObject object) {}

  void visitLibrary(Library library) {
    final specs = <int>[];
    void getChildSpecs(MetaObject object) {
      if (object is SpecBuilder) {
        specs.add(object.buildSpec());
      }
      object.visitChildren(getChildSpecs);
    }

    getChildSpecs(library);
  }
}

mixin SpecBuilder on MetaObject {
  int buildSpec();
}

class Library extends MultiChildMetaObject {
  Library({
    required this.name,
    required List<MetaObject> children,
  }) : super(children);

  final String name;
}

class Class extends MultiChildMetaObject {
  Class(this.name);

  final String name;
  final List<Type> types;
  final Extends types;
  List<Constructor> constructors;
  List<Methdod> methods;
  List<Field> members;
}
