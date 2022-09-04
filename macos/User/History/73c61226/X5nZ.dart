import 'package:form_generator/form_generator.dart';

class TitledSection extends WrappedSection {
  TitledSection({
    required String title,
    required super.fields,
    bool required = false,
  }) : super(
          widgetClass: 'FormSection',
          widgetParams: """
title: '$title',
required: $required
""",
          spacing: 'const SpaceSmall.h()',
        );
}
