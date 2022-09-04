import 'dart:async';

import 'package:analyzer/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/analysis/session.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:bonemeal/bonemeal.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:path/path.dart' as p;

part 'hook.g.dart';

class HookResolver {
  HookResolver(
    String path,
  ) : _source = AssetId.input(path);

  final AssetId _source;

  FutureOr<String> resolve(PathProvidingAssetReader reader) async {
    String sourcePath = reader.pathTo(_source);
    String fileContent = await reader.readAsString(_source);
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

      return unit.declarations
          .where(
              (CompilationUnitMember d) => d.declaredElement is FunctionElement)
          .map((declaration) {
        final element = declaration.declaredElement;
        if (element == null) return '';
        return fileContent.substring(declaration.offset, declaration.end);
      }).join('\n');
    }
    throw UnsupportedError('?');
  }
}
