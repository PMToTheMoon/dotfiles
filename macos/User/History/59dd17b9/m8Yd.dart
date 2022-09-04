import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';

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
    if (_code == null) {
      throw 'You can\'t access extractedCode before visited a node';
    }
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

String extractFunctionOrMethodBodyString(
  String source,
  Declaration declaration,
) {
  if (declaration is FunctionDeclaration) {
    return _extractFunctionBodyString(
        source, declaration.functionExpression.body);
  } else if (declaration is MethodDeclaration) {
    return _extractFunctionBodyString(source, declaration.body);
  }
  throw UnsupportedError(
      'Unsupported type for extraction: ${declaration.runtimeType}');
}

String extractDeclarationString(
  String source,
  Declaration declaration,
) {
  final firstToken = declaration.firstTokenAfterCommentAndMetadata;
  final lastToken = declaration.endToken;
  return source.substring(firstToken.offset, lastToken.end);
}

String _extractFunctionBodyString(String source, FunctionBody body) {
  if (body is BlockFunctionBody) {
    final block = body.block;
    if (block.childEntities.length > 2) {
      final firstToken = body.beginToken.next!;
      final lastToken = body.endToken.previous!;
      return source.substring(firstToken.offset, lastToken.end);
    }
  }
  throw "You can only extract strings from Function with a non-empty body";
}
