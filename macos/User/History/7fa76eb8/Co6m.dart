import 'package:analyzer/dart/analysis/analysis_context.dart';
import 'package:analyzer/dart/analysis/analysis_context_collection.dart';

void main() {
  List<String> includedPaths = <String>[/* ... */];
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
  // ...
}
