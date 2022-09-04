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
          'crossAxisAlignment': 'CrossAxisAlignment.strech',
          'children': literalList([
            refer('context.headlineMedium', 'package:neat/neat.dart')
                .call([title]),
            refer('context.bodyMedium', 'package:neat/neat.dart').call([body]),
          ]),
        }),
      ];
}
