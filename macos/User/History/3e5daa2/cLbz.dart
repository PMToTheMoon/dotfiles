import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/src/form_sections/form_section.dart';

class SpreadFormSection extends FormSection {
  const SpreadFormSection({
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
