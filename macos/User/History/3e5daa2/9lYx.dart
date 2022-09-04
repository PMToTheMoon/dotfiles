import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/src/form_sections/form_section.dart';

const spreadSectionTemplate = '''
{{ wrapper.class }}(
  {{ wrapper.params }},
  fields: [
    {{ fields }}
  ],
)''';

class SpreadSection extends FormSection {
  const SpreadSection({
    required super.spacing,
    required super.fields,
  });

  @override
  Future<FormSectionMetaData> build(BuildStep step) async {
    final fieldsMetaData = await Future.wait(
      fields.map((f) async => f.build(step)),
    );
    return FormSectionMetaData(
      fields: fieldsMetaData,
      instantiate:
          fieldsMetaData.map((m) => m.widgetDeclaration).join(',$spacing,'),
    );
  }
}
