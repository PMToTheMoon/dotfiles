import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';

class TitledSection extends WrappedFormSection {
  TitledSection({
    required Expression title,
    required Expression spacing,
    Expression? subtitle,
    bool required = false,
    required super.fields,
  }) : super(
          wrapper: (fields) => InvokeExpression.newOf(
            refer('Padding', 'package:material/material'),
            [],
            {
              'child': refer(
                'TitledSection',
                'package:common/common.dart',
              ).newInstance(
                [],
                {
                  'title': title,
                  if (subtitle != null) 'subtitle': subtitle,
                  'required': literal(required),
                  'child': refer('Column').newInstance([], {
                    'children': literalList(fields.map((e) => e.invokeWidget)),
                  })
                },
              ),
            },
          ),
          spacing: spacing,
        );
}
