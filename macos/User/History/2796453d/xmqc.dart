import 'framework.dart';

class DartProjectVisitor {
  void call(MetaObject object) {}
}

mixin SpecBuilder {
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
