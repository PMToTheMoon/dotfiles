import 'package:analyzer/dart/element/element.dart';
import 'package:bonemeal/bonemeal.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

class MirrorBuilder extends Generator {
  @override
  String generate(LibraryReader library, BuildStep buildStep) {
    ;
    final classes = library.classes.map(_mirrorClass);
    final out = Library((l) => l..body.addAll(classes));
    return;
  }

  Class _mirrorClass(ClassElement) {}
}
