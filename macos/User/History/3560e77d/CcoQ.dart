import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';

class WrappedFormSection extends FormSection {
  const WrappedFormSection({
    required super.spacing,
    required super.fields,
    this.columnNumber = 2,
  });

  final int columnNumber;
  final String horizontalSpacing;

  @override
  Future<FormSectionMetaData> build(BuildStep step) async {
    final fieldsMetaData = await Future.wait(
      fields.map((f) async => f.build(step)),
    );
    final len = fieldsMetaData.length;

    final chunks = <FormFieldMetaData>[];

    for (int i = 0; i < len; i += columnNumber) {
      var end = (i + columnNumber < len) ? i + columnNumber : len;
      chunks.add(fieldsMetaData.sublist(i, end));
    }
    final section = renderTemplate(wrappedSectionTemplate, step.uri, {
      'wrapper': {
        'class': widgetClass,
        'params': widgetParams,
      },
      'fields': chunks.map(
        (List<FormFieldMetaData> l) => l
            .map(
              (f) => f.widgetDeclaration,
            )
            .join(',$horizontalSpacing,'),
      )
      // chunks.map((list) => m.widgetDeclaration).join(',$spacing,'),
    });
    return FormSectionMetaData(
      fields: fieldsMetaData,
      instantiate: section,
    );
  }
}
