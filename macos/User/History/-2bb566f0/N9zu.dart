import 'package:analyzer/dart/ast/ast.dart';

String extractFullDeclaration(
  String source,
  Declaration declaration,
) {
  final firstToken = declaration.firstTokenAfterCommentAndMetadata;
  final lastToken = declaration.endToken;
  return source.substring(firstToken.offset, lastToken.end);
}
