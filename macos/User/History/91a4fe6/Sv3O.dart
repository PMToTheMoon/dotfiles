import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:bonemeal/bonemeal.dart';
import 'package:source_gen/source_gen.dart';

final _entrypointTypeChecker = TypeChecker.fromRuntime(Entrypoint);

bool hasEntrypointAnnotation(Element element) {
  return _entrypointTypeChecker.hasAnnotationOf(element);
}
