import 'package:bonemeal/bonemeal.dart';
import 'package:code_builder/code_builder.dart' show DartEmitter;

mixin SpecBuilder on MetaObject {
  int buildSpec();
}

class Library extends MultiChildMetaObject {
  Library({
    required this.name,
    required List<MetaObject> children,
  }) : super(children);

  final String name;

  int build(List<int> specs) {
    return 0;
  }
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
