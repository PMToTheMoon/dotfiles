import 'package:bonemeal/bonemeal.dart' hide BuildStep;
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/dart/element/element.dart';

import 'hook_builder_utils.dart';

class MultiHookBuilder extends GeneratorForAnnotation<ExtractHooks> {
  @override
  Future<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    final source = await buildStep.readAsString(buildStep.inputId);
    final node = extractElementNode(element);
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
    final declaration = extractFullDeclaration(
      source,
      node,
    );
    declarations.add(declaration);
    return super.visitFunctionDeclaration(node);
  }

  @override
  visitMethodDeclaration(MethodDeclaration node) {
    final declaration = extractFullDeclaration(
      source,
      node,
    );
    declarations.add(declaration);
    return super.visitMethodDeclaration(node);
  }
}
