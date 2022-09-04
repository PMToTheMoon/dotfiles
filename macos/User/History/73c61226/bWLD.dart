import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';

class TitledSection extends WrappedFormSection {
  TitledSection({
    required Expression title,
    Expression? subtitle,
    required super.fields,
    bool required = false,
  }) : super(
          wrapper: (fields) => InvokeExpression.newOf(
              refer('FormSection', 'package:common/common.dart'), [], {
            'title': title,
            if (subtitle != null) 'subtitle': subtitle,
            'required': required,
          }),
          widgetClass: 'FormSection',
          widgetParams: """
,${subtitle != null ? 'subtitle: $subtitle,' : ''}

""",
          spacing: 'const SpaceSmall.h()',
        );
}
