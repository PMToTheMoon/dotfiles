import 'package:analyzer/dart/ast/ast.dart';

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
