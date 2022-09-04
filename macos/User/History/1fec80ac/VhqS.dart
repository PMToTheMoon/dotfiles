import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element.dart';

String declareInlineHook({
  required String name,
  required String code,
  required String? functions,
}) {
  return """
final $name = InlineHook(
  inlineCode: Code('''
$code
'''),
  additionalFunction('''
$functions
'''),
);
""";
}

String transformFunctionDeclarationToVar(
  String source,
  FunctionDeclaration declaration, {
  bool inline = false,
}) =>
    transformFunctionOrMethodDeclarationToVar(
        name: declaration.name.toString(),
        source: source,
        declaration: declaration,
        inline: inline);

String transformMethodDeclarationToVar(
  String source,
  MethodDeclaration declaration, {
  bool inline = false,
}) =>
    transformFunctionOrMethodDeclarationToVar(
        name: declaration.name.toString(),
        source: source,
        declaration: declaration,
        inline: inline);

String transformFunctionOrMethodDeclarationToVar({
  required String name,
  required String source,
  required Declaration declaration,
  bool inline = false,
}) {
  final content = inline
      ? extractFunctionOrMethodBody(source, declaration)
      : extractFullDeclaration(source, declaration);
  final varName = '\$$name';
  return """
const String $varName = r'''
$content
''';
""";
}

String extractFullDeclaration(
  String source,
  Declaration declaration,
) {
  final firstToken = declaration.firstTokenAfterCommentAndMetadata;
  final lastToken = declaration.endToken;
  return source.substring(firstToken.offset, lastToken.end);
}

AstNode extractElementNode(Element element) {
  final session = element.session;
  final parsedLibrary = session!.getParsedLibraryByElement(element.library!)
      as ParsedLibraryResult;
  final elementDeclaration = parsedLibrary.getElementDeclaration(element);
  return elementDeclaration!.node;
}

String extractFunctionOrMethodBody(
  String source,
  Declaration declaration,
) {
  if (declaration is FunctionDeclaration) {
    return _extractFunctionBody(source, declaration.functionExpression.body);
  } else if (declaration is MethodDeclaration) {
    return _extractFunctionBody(source, declaration.body);
  }
  throw UnsupportedError(
      'Unsupported type for extraction: ${declaration.runtimeType}');
}

String _extractFunctionBody(String source, FunctionBody body) {
  if (body is BlockFunctionBody) {
    final block = body.block;
    if (block.childEntities.length > 2) {
      final firstToken = body.beginToken.next!;
      final lastToken = body.endToken.previous!;
      return source.substring(firstToken.offset, lastToken.end);
    }
  }
  throw "You can only use inline hooks on Function with a non-empty body";
}
