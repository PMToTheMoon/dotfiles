import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/src/form_sections/form_section.dart';

/// A Form Section that spread it widgets into it's parent
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

    ;
    return FormSectionMetaData(
      fields: fieldsMetaData,
      instantiate: literalList([
        for (final f in fieldsMetaData)
          ...[f.invokeWidget, spacing]
      ])
          fieldsMetaData.map((m) => m.widgetDeclaration).join(',$spacing,'),
    );
  }
}
