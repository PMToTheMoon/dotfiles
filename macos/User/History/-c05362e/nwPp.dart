import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';

class BodyTextSection extends FormSection {
  BodyTextSection({
    required super.parts,
    required this.title,
    required this.body,
  });

  final String title;
  final String body;

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
