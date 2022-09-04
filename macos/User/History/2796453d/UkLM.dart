import 'dart:collection';

import 'package:bonemeal/bonemeal.dart';
import 'package:code_builder/code_builder.dart' hide Library;
import 'package:code_builder/code_builder.dart' as cb show Library;

mixin SpecBuilder on MetaObject {
  int buildSpec();
}

class Library extends MetaObject {
  Library({
    required this.name,
    required this.specs,
    super.key,
  });

  final String name;
  final List<Spec> specs;

  cb.Library build() {
    return cb.Library((l) => l
      ..name = name
      ..body.addAll(specs));
  }
}

class MultiPartLibrary extends MultiChildMetaObject {
  MultiPartLibrary({
    required this.name,
    required this.specs,
    required super.children,
  });

  final String name;
  final List<Spec> specs;

  cb.Library build(List<String> partUrls) {
    return cb.Library((l) => l
      ..name = name
      ..directives.addAll([
        for (final url in partUrls) Directive.part(url),
      ])
      ..body.addAll(specs));
  }
}

class LibraryPart extends MetaObject {
  LibraryPart({
    required this.name,
    super.key,
  });

  final String name;
  final List<Spec> specs;

  cb.Library build(String parent) {
    return cb.Library((l) => l
      ..name = name
      ..directives.add(Directive.partOf(parent))
      ..body.addAll(specs));
  }
}
