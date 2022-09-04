import 'dart:async';
// import 'dart:io';

import 'package:analyzer/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/analysis/session.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:bonemeal/bonemeal.dart';
import 'package:path/path.dart' as p;

class Hook {
  Hook(
    String path,
    this.hook,
  ) : source = AssetId.input(path);

  final AssetId source;
  final String hook;

  FutureOr<String?> read(PathProvidingAssetReader reader) async {
    String sourcePath = reader.pathTo(source);
    String fileContent = await reader.readAsString(source);
    sourcePath = p.absolute(p.normalize(sourcePath));
    AnalysisContextCollection collection = AnalysisContextCollection(
      includedPaths: [
        sourcePath,
      ],
    );
    final context = collection.contextFor(sourcePath);
    final AnalysisSession session = context.currentSession;
    final result = await session.getResolvedUnit(sourcePath);
    if (result is ResolvedUnitResult) {
      CompilationUnit unit = result.unit;

      unit.declarations.firstWhere(
        (CompilationUnitMember d) => d.declaredElement?.displayName == hook,
      );
      for (final declaration in unit.declarations) {
        final element = declaration.declaredElement;
        print(declaration.offset);
        print(declaration.length);
        print(fileContent.substring(declaration.offset, declaration.end));
        if (element != null) {
          print(element.displayName);
          print(element.source);
          print(element.location);
          print(element.getDisplayString(withNullability: true));
        }
      }
    }
  }
}
