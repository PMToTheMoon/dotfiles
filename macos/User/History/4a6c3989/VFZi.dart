import 'dart:async';
// import 'dart:io';

import 'package:analyzer/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/analysis/session.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:bonemeal/bonemeal.dart';

@JsonSerializable()
class Hook {
  const Hook();

  String path;
  String name;

  factory Hook.fromJson(Map json) => _$HookFromJson(json);
}

class HookResolver {
  HookResolver(
    String path,
  ) : source = AssetId.input(path);

  final AssetId source;
  final String hook;

  FutureOr<String> read(PathProvidingAssetReader reader) async {
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

      final declaration = unit.declarations.firstWhere(
        (CompilationUnitMember d) => d.declaredElement?.displayName == hook,
      );
      return fileContent.substring(declaration.offset, declaration.end);
    } else {
      throw UnsupportedError('?');
    }
  }
}
