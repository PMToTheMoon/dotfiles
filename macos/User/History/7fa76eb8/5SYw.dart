import 'package:analyzer/dart/analysis/analysis_context.dart';
import 'package:analyzer/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/analysis/session.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:path/path.dart' as p;
import 'package:source_gen/source_gen.dart';
import 'package:test/test.dart';

Future<void> main() async {
  test('analyzer', () async {
    final path = "/Users/pm/Project/bonemeal/meta_proj/lib";

    List<String> includedPaths = <String>[path];
    AnalysisContextCollection collection =
        AnalysisContextCollection(includedPaths: includedPaths);
    await analyzeSomeFiles(collection, includedPaths);
  });
  // final path = p.absolute(p.join(p.current, 'lib/'));
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
  // for (String path in includedPaths) {
  //   AnalysisContext context = collection.contextFor(path);
  //   analyzeSingleFile(context, path);
  // }
}

Future<void> analyzeSingleFile(AnalysisContext context, String path) async {
  AnalysisSession session = context.currentSession;
  final unit = await session.getUnitElement(path);
  // final library = session.getParsedLibrary(path);
  if (unit is UnitElementResult) {
    final library = unit.element.enclosingElement3.library;
    final lib = LibraryReader(library);
    print(library is LibraryElement);
  }
}

class MetaProjectVisitor extends GeneralizingAstVisitor {
  @override
  visitAnnotatedNode(AnnotatedNode node) {
    // print("found annotated node ${node")
  }
}
