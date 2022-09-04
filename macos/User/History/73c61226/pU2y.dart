import 'package:form_generator/form_generator.dart';

class TitledSection extends WrappedSection {
  TitledSection({
    required super.spacing,
    required super.fields,
  }) : super(
          widgetClass: 'FormSection',
        );
}
