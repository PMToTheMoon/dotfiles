import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';

class BodyTextSection extends FormSection {
  BodyTextSection({
    required super.parts,
    required this.title,
    required this.body,
  });

  final Expression title;
  final Expression body;

  @override
  String get path => '';

  @override
  Iterable<Expression> widgetInvocations(
    BuildStep step,
    Expression accessController,
    Iterable<Expression> children,
  ) =>
      [
        refer('context.headlineMedium', 'package:neat/neat.dart').call([title]),
        refer('context.bodySmall', 'package:neat/neat.dart').call([body]),
        ...children,
      ];
}
