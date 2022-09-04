import 'package:bonemeal/bonemeal.dart' hide BuildStep;

import 'package:bonemeal_gen/src/utils/utils.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:analyzer/dart/element/element.dart';

import 'hook_builder_utils.dart';

class HookBuilderException implements Exception {
  HookBuilderException(this.message);
  final String message;
  @override
  String toString() => 'TransformerBuilder: $message';
}

class HookBuilder extends GeneratorForAnnotation<ToHook> {
  final List<String> hooks = [];
  String? hookList;

  @override
  Future<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    final source = await buildStep.readAsString(buildStep.inputId);

    if (element is FunctionElement) {
      final m = extractMethodFromExecutableElement(source, element);
      final name = hookName(element.displayName);
      hooks.add(declareHook(className: name, method: m));
    } else if (element is ClassElement) {}
    if (hooks.isEmpty) {
      throw HookBuilderException(
          'ToTransformer annotation should only be used on utils or classes, extensions and mixins that contains at least one method.');
    }

    return [
      ...hooks,
      hookList,
    ].whereType<String>().join('\n');
  }

  _generateHooksFromMethods(
    String source,
    Element element,
    List<MethodElement> methods,
  ) {
    final List<String> hookNames = [];
    for (final method in methods) {
      final m = extractMethodFromExecutableElement(source, method);
      final name = hookName(method.displayName);
      hookNames.add(name);
      hooks.add(declareHook(className: name, method: m));
    }
    final list = literalList(
      hookNames.map((e) => refer(e).newInstance([])),
    ).accept(
      DartEmitter(
        useNullSafetySyntax: true,
      ),
    );
    hookList = "final ${element.displayName.camelCase} = $list;";
  }
}
