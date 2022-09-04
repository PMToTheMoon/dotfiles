import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';

class TitledSection extends WrappedFormSection {
  TitledSection({
    required String title,
    String? subtitle,
    required super.fields,
    bool required = false,
  }) : super(
          wrapper: (fields) => InvokeExpression.newOf(
              refer('FormSection', 'package:common/common.dart'),
              positionalArguments),
          widgetClass: 'FormSection',
          widgetParams: """
title: $title,${subtitle != null ? 'subtitle: $subtitle,' : ''}
required: $required
""",
          spacing: 'const SpaceSmall.h()',
        );
}
