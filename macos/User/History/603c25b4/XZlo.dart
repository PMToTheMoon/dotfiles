import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/src/form_section/form_section.dart';

const headerSectionTemplate = '''
{{ wrapper.class }}(
  {{ wrapper.params }},
  fields: [
    {{ fields }}
  ],
)''';

class WrappedSection extends FormSection {
  WrappedSection({
    required this.widgetClass,
    required this.widgetParams,
    required super.spacing,
    required super.fields,
  });

  final widgetClass;
  final widgetParams;

  FormSectionMetaData build(BuildStep step) {}
}
