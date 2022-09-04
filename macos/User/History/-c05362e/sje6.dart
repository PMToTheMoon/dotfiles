import 'package:bonemeal/bonemeal.dart';
import 'package:code_builder/src/specs/expression.dart';
import 'package:bonemeal_core/src/meta_object/build_step.dart';
import 'package:form_generator/form_generator.dart';

class BodyTextSection extends FormSection {
  BodyTextSection({required super.parts});

  @override
  String get path => '';

  @override
  Iterable<Expression> widgetInvocations(
    BuildStep step,
    Expression accessController,
    Iterable<Expression> children,
  ) =>
      [
        refer('context.headlineMedium', 'package:neat/neat.dart').call([]),
        refer('context.bodySmall', 'package:neat/neat.dart').call([]),
        ...children,
      ];
}
