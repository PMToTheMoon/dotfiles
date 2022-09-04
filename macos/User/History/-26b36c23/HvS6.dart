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
    String? entrypoint;
    List<String> functions = [];

    if (element is FunctionElement) {
      final extractor = CodeExtractor(source: source);
      node.accept(extractor);
      entrypoint = extractor.extractedCode;
    } else if (element is ClassElement) {
      for (final method in element.methods) {
        final extractor = CodeExtractor(source: source);
        node.accept(extractor);
        if (hasEntrypointAnnotation(method)) {
          final node = getAstNodeFromElement(method) as MethodDeclaration;
          entrypoint = extractor.extractedCode;
        } else {
          functions.add(extractor.extractedCode);
        }
      }
    }
    if (entrypoint == null) {
      throw TransformerBuilderException(
          'ToTransformer annotation should only be used on functions or classes, extensions and mixins that contains at least one method declaration annotated with @Entrypoint.');
    }

    return declareTransformer(
      baseName: element.displayName,
      transformer: entrypoint,
      functions: functions,
    );
  }
}
