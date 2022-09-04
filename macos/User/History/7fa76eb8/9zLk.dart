import 'package:analyzer/dart/analysis/analysis_context.dart';
import 'package:analyzer/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/analysis/session.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';

Future<void> main() async {
  List<String> includedPaths = <String>["lib/"];
  AnalysisContextCollection collection =
      AnalysisContextCollection(includedPaths: includedPaths);
}

Future<void> analyzeSomeFiles(
  AnalysisContextCollection collection,
  List<String> includedPaths,
) async {
  for (String path in includedPaths) {
    AnalysisContext context = collection.contextFor(path);
    analyzeSingleFile(context, path);
  }
}

Future<void> analyzeSingleFile(AnalysisContext context, String path) async {
  AnalysisSession session = context.currentSession;
  final unit = await session.getUnitElement(path);
  if (unit is UnitElementResult) {
    unit.element;
  }
}

class MetaProjectVisitor extends GeneralizingAstVisitor {
  @override
  visitAnnotatedNode(AnnotatedNode node) {}
}
