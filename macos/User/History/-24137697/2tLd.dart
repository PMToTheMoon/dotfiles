import 'package:analyzer/dart/element/element.dart';
import 'package:bonemeal/bonemeal.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

class MirrorBuilder extends Generator {
  @override
  String generate(LibraryReader library, BuildStep buildStep) {
    final mirroredClasses = library.classes.map(_mirrorClass);
    final out = Library((l) => l..body.addAll(mirroredClasses));
    final emitter = defaultEmitter();
    formatter.format(out.accept(emitter).toString());
    return;
  }

  Spec _mirrorClass(ClassElement e) {
    final $class = refer('Class').call([literal(($) => $)]);

    return declareFinal('${e.displayName}Mirror').assign($class);
  }
}
