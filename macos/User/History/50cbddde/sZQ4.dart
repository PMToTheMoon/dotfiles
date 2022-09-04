import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:bonemeal/bonemeal.dart' hide BuildStep;
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'hook_builder_utils.dart';
import 'multi_hooks_builder.dart';

Builder hookBuilder(BuilderOptions options) =>
    PartBuilder([HookBuilder(), MultiHookBuilder()], '.hook.dart');

// Builder hooksBuilder(BuilderOptions options) => PartBuilder([], '.hook.dart');

class HookBuilder extends GeneratorForAnnotation<InlineHook> {
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
      return transformFunctionDeclarationToVar(
        source,
        node,
        inline: inline,
      );
    }
    throw 'Hook annotation should only bes used on function declaration';
  }
}
