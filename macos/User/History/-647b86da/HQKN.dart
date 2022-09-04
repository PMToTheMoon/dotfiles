import 'package:analyzer/dart/ast/ast.dart';

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
