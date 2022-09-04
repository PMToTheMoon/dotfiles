import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';
import 'package:ipr/ipr.dart';

class TitledSection extends WrappedFormSection {
  TitledSection({
    required Expression title,
    required super.spacing,
    Expression? padding,
    Expression? subtitle,
    bool required = false,
    required super.fields,
  }) : super(wrapper: (fields) {
          final section = _buildTitledSection(
            title: title,
            fields: fields,
            subtitle: subtitle,
            required: required,
          );
          if (padding != null) {
            return wrapWithPadding(section, padding);
          }
          return section;
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
