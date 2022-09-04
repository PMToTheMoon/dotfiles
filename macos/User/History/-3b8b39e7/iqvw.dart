import 'package:analyzer/dart/analysis/analysis_context.dart';
import 'package:analyzer/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/analysis/session.dart';

import 'package:path/path.dart' as p;
import 'package:source_gen/source_gen.dart';

class Annotation {}

Future<void> main() async {
  final path = "/Users/pm/Project/bonemeal/meta_proj/lib";

  List<String> includedPaths = <String>[path];
  AnalysisContextCollection collection =
      AnalysisContextCollection(includedPaths: includedPaths);
  await analyzeSomeFiles(collection, includedPaths);
}

Future<void> analyzeSomeFiles(
  AnalysisContextCollection collection,
  List<String> includedPaths,
) async {
  for (AnalysisContext context in collection.contexts) {
    for (String path in context.contextRoot.analyzedFiles()) {
      await analyzeSingleFile(context, path);
    }
  }
}

Future<void> analyzeSingleFile(AnalysisContext context, String path) async {
  AnalysisSession session = context.currentSession;
  final unit = await session.getUnitElement(path);
  if (unit is UnitElementResult) {
    final library = unit.element.library;
    // exclude part of files
    if (p.basename(library.identifier) != p.basename(path)) return;
    final reader = LibraryReader(library);
    final typeChecker = TypeChecker.fromRuntime(Annotation);
    final elements = reader.annotatedWith(typeChecker).toSet();
    for (final element in elements) {
      print("found element ${element.element.displayName}");
    }
  }
}
