import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:bonemeal/bonemeal.dart' hide BuildStep;
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

Builder hookBuilder(BuilderOptions options) =>
    PartBuilder([HookBuilder(), HooksBuilder()], '.hook.dart');

// Builder hooksBuilder(BuilderOptions options) => PartBuilder([], '.hook.dart');

class HookBuilder extends GeneratorForAnnotation<ToHook> {
  @override
  Future<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    final source = await buildStep.readAsString(buildStep.inputId);
    final inline = annotation.peek('inline')?.boolValue ?? false;
    final node = extractElementNode(element);
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

class HooksBuilder extends GeneratorForAnnotation<ExtractHooks> {
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
