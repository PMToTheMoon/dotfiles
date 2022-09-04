import 'package:analyzer/dart/analysis/analysis_context.dart';
import 'package:analyzer/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/dart/analysis/session.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';

void main() {
  List<String> includedPaths = <String>["lib/"];
  AnalysisContextCollection collection =
      AnalysisContextCollection(includedPaths: includedPaths);
}

void analyzeSomeFiles(
    AnalysisContextCollection collection, List<String> includedPaths) {
  for (String path in includedPaths) {
    AnalysisContext context = collection.contextFor(path);
    analyzeSingleFile(context, path);
  }
}

void analyzeSingleFile(AnalysisContext context, String path) {
  AnalysisSession session = context.currentSession;
  final unit = session.getParsedUnit(path);
}

class MetaProjectVisitor extends GeneralizingAstVisitor {
  @override
  visitAnnotatedNode(AnnotatedNode node) {}
}
