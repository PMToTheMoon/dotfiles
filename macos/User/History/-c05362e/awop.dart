import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';

class BodyTextSection extends FormDecoration {
  BodyTextSection({
    required this.title,
    required this.body,
  });

  final Expression title;
  final Expression body;

  @override
  Iterable<Expression> widgetInvocations() => [
        refer('Column').call([], {
          'children': [
            refer('context.headlineMedium', 'package:neat/neat.dart')
                .call([title]),
            refer('context.bodyMedium', 'package:neat/neat.dart').call([body]),
          ],
        }),
      ];
}
