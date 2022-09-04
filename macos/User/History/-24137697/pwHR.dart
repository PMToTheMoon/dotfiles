import 'package:analyzer/dart/element/element.dart';
import 'package:bonemeal/bonemeal.dart' hide BuildStep;
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:path/path.dart' as p;

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
  Map<String, List<String>> get buildExtensions => {
        '_template.dart': ['_template.g.dart']
      };

  @override
  Future<void> build(BuildStep buildStep) async {
    final id = buildStep.inputId;
    final path = id.path.replaceFirst('_template.dart', '_template.g.dart');
    final newId = AssetId(id.package, path);
    final library = await buildStep.resolver.libraryFor(buildStep.inputId);
    final content = _buildContent(LibraryReader(library));
    await buildStep.writeAsString(newId, content);
  }

  String _buildContent(LibraryReader library) {
    final mirroredClasses = library.classes.map(_mirrorClass);
    final out = Library((l) => l..body.addAll(mirroredClasses));
    final emitter = defaultEmitter();
    return out.accept(emitter).toString();
  }

  Spec _mirrorClass(ClassElement e) {
    final $class = refer('Class').call([literal(($) => $)]);

    return declareFinal('${e.displayName}Mirror').assign($class);
  }
}
