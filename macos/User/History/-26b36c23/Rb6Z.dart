import 'dart:math';

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
    final source = await buildStep.readAsString(buildStep.inputId);
    final node = getAstNodeFromElement(element);
    final visitor = TransformerVisitor(source: source);
    String? entrypoint;
    List<String> functions = [];

    if (element is FunctionElement) {
      node.accept(visitor);
    } else if (element is ClassElement) {
      for (final method in element.methods) {
        if (hasEntrypointAnnotation(method)) {
          final node = getAstNodeFromElement(method) as ;
          final code = extractFunctionOrMethodBodyString(source, node);
          if (entrypoint != null) {
            throw 'Hooks can only have one entry point per class';
          }
          entrypoint = code;
        }
      }
    }

    // return "test";
    if (entrypoint == null) {
      throw TransformerBuilderException(
          'ToTransformer annotation should only be used on functions or classes, extensions and mixins that contains at least one method declaration annotated with @Entrypoint.');
    }
    final declarations = visitor.declarations.join('\n');
    return declareTransformer(
      baseName: element.displayName,
      transformer: entrypoint,
      functions: declarations,
    );
  }
}

enum CodeExtractorType {
  body,
  declaration
}

class CodeExtractor extends GeneralizingAstVisitor {
  CodeExtractor({
    required this.source,
    this.extractor = CodeExtractorType.declaration,
  });

  final String source;
  final CodeExtractorType extractor;

  late String _code;

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
