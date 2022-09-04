import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';

class WrappedFormSection extends FormSection {
  const WrappedFormSection({
    required super.spacing,
    required super.fields,
  });

  final columnNumber;

  @override
  Future<FormSectionMetaData> build(BuildStep step) async {
    final fieldsMetaData = await Future.wait(
      fields.map((f) async => f.build(step)),
    );
    final len = fieldsMetaData.length;

    var chunks = [];

    for (int i = 0; i < len; i += size) {
      var end = (i + size < len) ? i + size : len;
      chunks.add(letters.sublist(i, end));
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
