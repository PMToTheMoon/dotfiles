import 'package:bonemeal/bonemeal.dart';
import 'package:code_builder/code_builder.dart' show Spec;
import 'package:code_builder/code_builder.dart' as cb show Library;

mixin SpecBuilder on MetaObject {
  int buildSpec();
}

class Library extends MultiChildMetaObject {
  Library({
    required this.name,
    required List<MetaObject> children,
  }) : super(children);

  final String name;

  cb.Library build(List<Spec> specs) {
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
