import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';

class WrappedFormSection extends FormSection {
  const WrappedFormSection({
    required super.spacing,
    required super.fields,
    this.columnNumber = 2,
  });

  final int columnNumber;

  @override
  Future<FormSectionMetaData> build(BuildStep step) async {
    final fieldsMetaData = await Future.wait(
      fields.map((f) async => f.build(step)),
    );
    final len = fieldsMetaData.length;

    var chunks = [];

    for (int i = 0; i < len; i += columnNumber) {
      var end = (i + columnNumber < len) ? i + columnNumber : len;
      chunks.add(fieldsMetaData.sublist(i, end));
    }
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
