import 'package:analyzer/dart/ast/ast.dart';
import 'package:bonemeal/bonemeal.dart';
import 'package:source_gen/source_gen.dart';

final _entrypointTypeChecker = TypeChecker.fromRuntime(Entrypoint);
bool hasEntrypointAnnotation(AstNode node) {
  bool isEntryPoint = false;
  if (node.metadata.isNotEmpty) {
    final annotationElement = node.metadata.first.element;
    if (annotationElement != null) {
      isEntryPoint = annotationChecker.hasAnnotationOf(annotationElement);
    }
  }
}
