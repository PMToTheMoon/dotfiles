String _transformFunctionDeclarationToVar(
  String source,
  FunctionDeclaration declaration, {
  bool inline = false,
}) =>
    _transformFunctionOrMethodDeclarationToVar(
        name: declaration.name.toString(),
        source: source,
        declaration: declaration,
        inline: inline);

String _transformMethodDeclarationToVar(
  String source,
  MethodDeclaration declaration, {
  bool inline = false,
}) =>
    _transformFunctionOrMethodDeclarationToVar(
        name: declaration.name.toString(),
        source: source,
        declaration: declaration,
        inline: inline);

String _transformFunctionOrMethodDeclarationToVar({
  required String name,
  required String source,
  required Declaration declaration,
  bool inline = false,
}) {
  final content = inline
      ? _extractFunctionOrMethodBody(source, declaration)
      : _extractFullDeclaration(source, declaration);
  final varName = '\$$name';
  return """
const String $varName = r'''
$content
''';
""";
}

AstNode _extractElementNode(Element element) {
  final session = element.session;
  final parsedLibrary = session!.getParsedLibraryByElement(element.library!)
      as ParsedLibraryResult;
  final elementDeclaration = parsedLibrary.getElementDeclaration(element);
  return elementDeclaration!.node;
}

String _extractFullDeclaration(
  String source,
  Declaration declaration,
) {
  final firstToken = declaration.firstTokenAfterCommentAndMetadata;
  final lastToken = declaration.endToken;
  return source.substring(firstToken.offset, lastToken.end);
}

String _extractFunctionOrMethodBody(
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
