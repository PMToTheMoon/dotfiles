import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';

class TitledSection extends WrappedFormSection {
  TitledSection({
    required Expression title,
    required super.spacing,
    Expression? padding,
    Expression? subtitle,
    bool required = false,
    required super.fields,
  }) : super(wrapper: (fields) {
          if (padding != null) {
            return InvokeExpression.newOf(
                refer('Padding', 'package:material/material'), [], {
              'padding': padding,
              'child': _buildTitledSection(
                title: title,
                fields: fields,
                subtitle: subtitle,
                required: required,
              ),
            });
          }
        });
}

Expression _buildTitledSection({
  required Expression title,
  required List<FormFieldMetaData> fields,
  Expression? subtitle,
  bool required = false,
}) {
  return refer(
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
  );
}
