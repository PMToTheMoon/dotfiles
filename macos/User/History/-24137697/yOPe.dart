import 'package:analyzer/dart/element/element.dart';
import 'package:bonemeal/bonemeal.dart' hide BuildStep;
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

// class MirrorBuilder extends Generator {
//   @override
//   String generate(LibraryReader library, BuildStep buildStep) {
//     final mirroredClasses = library.classes.map(_mirrorClass);
//     final out = Library((l) => l..body.addAll(mirroredClasses));
//     final emitter = defaultEmitter();
//     return out.accept(emitter).toString();
//   }

//   Spec _mirrorClass(ClassElement e) {
//     final $class = refer('Class').call([literal(($) => $)]);

//     return declareFinal('${e.displayName}Mirror').assign($class);
//   }
// }

class MirrorBuilder implements Builder {
  @override
  Future<void> build(BuildStep buildStep) async {
    // Will throw for aggregate builders, because '$lib$' isn't a real input!
    // buildStep.readAsString(buildStep.inputId);
    print(buildStep.inputId);
  }

  @override
  Map<String, List<String>> get buildExtensions => {
        '.dart': ['.mirror.dart']
      };
}
