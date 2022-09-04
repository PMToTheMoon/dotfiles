import 'package:analyzer/dart/element/element.dart';
import 'package:bonemeal/bonemeal.dart' hide BuildStep;
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:path/path.dart' as p;

class MirrorBuilder implements Builder {
  @override
  Future<void> build(BuildStep buildStep) async {
    final id = buildStep.inputId;
    final path = id.path.replaceFirst('_template.dart', '_template.g.dart');
    final newId = AssetId(id.package, path);
    await buildStep.writeAsString(newId, ':)');
  }

  @override
  Map<String, List<String>> get buildExtensions => {
        '_template.dart': ['_template.g.dart']
      };
}
