import 'package:analyzer/dart/ast/ast.dart';
import 'package:bonemeal_gen/src/utils/utils.dart';

String declareInlineHook({
  required String name,
  required String inlineCode,
  required String? utils,
}) {
  return """
final $name = InlineHook(
  inlineCode: Code('''
$inlineCode
'''),
  additionalFunction('''
$utils
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
      ? extractFunctionOrMethodBodyString(source, declaration)
      : extractDeclarationString(source, declaration);
  final varName = '\$$name';
  return """
const String $varName = r'''
$content
''';
""";
}
