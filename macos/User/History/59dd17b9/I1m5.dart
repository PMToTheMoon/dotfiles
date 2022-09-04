enum CodeExtractorType { body, declaration }

class CodeExtractor extends GeneralizingAstVisitor {
  CodeExtractor({
    required this.source,
    this.extractor = CodeExtractorType.declaration,
  });

  final String source;
  final CodeExtractorType extractor;

  String? _code;

  String get extractedCode {
    if (_code == null)
      throw 'You can\'t access extractedCode before visited a node';
    return _code!;
  }

  @override
  visitFunctionDeclaration(FunctionDeclaration node) {
    _extractCode(source, node);
    return super.visitFunctionDeclaration(node);
  }

  @override
  visitMethodDeclaration(MethodDeclaration node) {
    _extractCode(source, node);
    return super.visitMethodDeclaration(node);
  }

  void _extractCode(String source, Declaration node) {
    switch (extractor) {
      case CodeExtractorType.body:
        _code = extractFunctionOrMethodBodyString(source, node);
        break;
      case CodeExtractorType.declaration:
        _code = extractDeclarationString(
          source,
          node,
        );
    }
  }
}
