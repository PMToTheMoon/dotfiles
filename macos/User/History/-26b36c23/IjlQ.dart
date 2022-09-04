import 'package:bonemeal/bonemeal.dart' hide BuildStep;

import 'package:bonemeal_gen/src/utils/utils.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/dart/element/element.dart';

import 'transformer_builder_utils.dart';

class TransformerBuilderException implements Exception {
  TransformerBuilderException(this.message);
  final String message;
  @override
  String toString() => 'TransformerBuilder: $message';
}

Builder transformerBuilder(BuilderOptions options) => PartBuilder(
      [TransformerBuilder()],
      '.tr.dart',
    );

class TransformerBuilder extends GeneratorForAnnotation<ToTransformer> {
  @override
  Future<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    print("test");
    final source = await buildStep.readAsString(buildStep.inputId);
    final node = getAstNodeFromElement(element);

    // return "test";
    final visitor = TransformerVisitor(source: source);
    node.accept(visitor);
    if (visitor.entrypoint == null) {
      throw TransformerBuilderException(
          'ToTransformer annotation should only be used on functions or classes, extensions and mixins that contains at least one method declaration annotated with @Entrypoint.');
    }
    final entrypoint = visitor.entrypoint;
    if (entrypoint == null) {
      throw "Inline hooks should have a function annotated with @Entrypoint";
    }
    final declarations = visitor.declarations.join('\n');
    return declareTransformer(
      baseName: element.displayName,
      transformer: entrypoint,
      functions: declarations,
    );
  }

  String _functionToTransformer(String source, FunctionDeclaration node) {
    final body = extractFunctionOrMethodBodyString(source, node);
    return declareTransformer(
      baseName: node.name.toString(),
      transformer: body,
    );
  }
}

class TransformerVisitor extends GeneralizingAstVisitor {
  TransformerVisitor({
    required this.source,
  });

  final String source;

  String? entrypoint;
  final List<String> declarations = [];

  @override
  visitFunctionDeclaration(FunctionDeclaration node) {
    _extractEntryPoint(source, node);
    return super.visitFunctionDeclaration(node);
  }

  @override
  visitMethodDeclaration(MethodDeclaration node) {
    if (hasEntrypointAnnotation(node)) {
      _extractEntryPoint(source, node);
    } else {
      final declaration = extractDeclarationString(
        source,
        node,
      );
      declarations.add(declaration);
    }

    return super.visitMethodDeclaration(node);
  }

  void _extractEntryPoint(String source, Declaration node) {
    final code = extractFunctionOrMethodBodyString(source, node);
    if (entrypoint != null) {
      throw 'Hooks can only have one entry point per class';
    }
    entrypoint = code;
  }
}
