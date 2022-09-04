import 'package:analyzer/dart/analysis/analysis_context.dart';
import 'package:analyzer/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/analysis/session.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:bonemeal/bonemeal.dart';
import 'package:build/build.dart';
import 'package:glob/glob.dart';
import 'package:glob/list_local_fs.dart';
import 'package:path/path.dart' as p;
import 'package:source_gen/source_gen.dart';
import 'package:test/test.dart';

Future<void> main() async {
  test('analyzer', () async {
    final glob = Glob("/Users/pm/Project/bonemeal/meta_proj/lib/**.dart",
        recursive: true, caseSensitive: true);
    final matches = glob.listSync().map((e) => e.path).toList();

    final r = ReleasableResolver();

    // List<String> includedPaths = <String>[path];
    AnalysisContextCollection collection =
        AnalysisContextCollection(includedPaths: matches);
    await analyzeSomeFiles(collection, matches);
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
    final library = unit.element.enclosingElement3;
    if (library is LibraryElement) {
      // final library = unit.element.enclosingElement3.library;

      final reader = LibraryReader(library);
      final typeChecker = TypeChecker.fromRuntime(ToHook);
      for (final element in reader.annotatedWith(typeChecker)) {
        print("found element ${element.element.displayName}");
      }
    }
  }
}

class MetaProjectVisitor extends GeneralizingAstVisitor {
  @override
  visitAnnotatedNode(AnnotatedNode node) {
    // print("found annotated node ${node")
  }
}
