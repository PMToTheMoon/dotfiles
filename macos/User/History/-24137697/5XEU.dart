import 'package:bonemeal/bonemeal.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

class MirrorBuilder extends Generator {
  @override
  String generate(LibraryReader library, BuildStep buildStep) {
    library.classes;
    final out = Library((l) => l..body.add(classes));
    return;
  }
}
