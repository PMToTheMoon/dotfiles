import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/src/form_sections/form_section.dart';

const wrappedSectionTemplate = '''
{{ wrapper.class }}(
  {{ wrapper.params }},
  fields: [
    {{ fields }}
  ],
)''';

class WrappedFormSection extends FormSection {
  const WrappedFormSection({
    required this.widgetClass,
    required this.widgetParams,
    required super.spacing,
    required super.fields,
  });

  final String widgetClass;
  final String widgetParams;

  @override
  Future<FormSectionMetaData> build(BuildStep step) async {
    final fieldsMetaData = await Future.wait(
      fields.map((f) async => f.build(step)),
    );
    final section = renderTemplate(wrappedSectionTemplate, step.uri, {
      'wrapper': {
        'class': widgetClass,
        'params': widgetParams,
      },
      'fields':
          fieldsMetaData.map((m) => m.widgetDeclaration).join(',$spacing,'),
    });
    return FormSectionMetaData(
      fields: fieldsMetaData,
      instantiate: section,
    );
  }
}
