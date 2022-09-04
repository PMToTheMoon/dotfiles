import 'dart:math';

import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:bonemeal/bonemeal.dart' hide BuildStep;
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

Builder hookBuilder(BuilderOptions options) =>
    PartBuilder([HookBuilder()], '.hook.dart');

Builder hooksBuilder(BuilderOptions options) =>
    PartBuilder([HooksBuilder()], '.hook.dart');

class HookBuilder extends GeneratorForAnnotation<Hook> {
  @override
  Future<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    final source = await buildStep.readAsString(buildStep.inputId);
    final inline = annotation.peek('inline')?.boolValue ?? false;
    final node = _extractElementNode(element);
    if (node is FunctionDeclaration) {
      return _transformFunctionDeclarationToVar(
        source,
        node,
        inline: inline,
      );
    }
    throw 'Hook annotation should only bes used on function declaration';
  }
}

class HooksBuilder extends GeneratorForAnnotation<Hooks> {
  @override
  Future<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    final source = await buildStep.readAsString(buildStep.inputId);
    final node = _extractElementNode(element);
    final visitor = HooksVisitor(source: source);
    node.visitChildren(visitor);
    if (visitor.declarations.isEmpty) {
      throw 'Hook annotation should only be used on classes, extensions or mixins that contain at least one method declaration';
    }
    return visitor.declarations.join('\n');
  }
}

class HooksVisitor extends GeneralizingAstVisitor {
  HooksVisitor({
    required this.source,
  });

  final String source;

  final List<String> declarations = [];

  @override
  visitFunctionDeclaration(FunctionDeclaration node) {
    final declaration = _transformFunctionDeclarationToVar(
      source,
      node,
      inline: false,
    );
    declarations.add(declaration);
    return super.visitFunctionDeclaration(node);
  }

  @override
  visitMethodDeclaration(MethodDeclaration node) {
    final declaration = _transformMethodDeclarationToVar(
      source,
      node,
      inline: false,
    );
    declarations.add(declaration);
    return super.visitMethodDeclaration(node);
  }
}

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
