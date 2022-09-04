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
    final chunks = _split(fieldsMetaData, 2);
    final rowContents = chunks.map(_toRowContent).toList();
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
      ),
      // chunks.map((list) => m.widgetDeclaration).join(',$spacing,'),
    });
    return FormSectionMetaData(
      fields: fieldsMetaData,
      instantiate: section,
    );
  }
}

List<List<T>> _split<T>(List<T> l, int n) {
  final len = l.length;
  final List<List<T>> chunks = [];

  for (int i = 0; i < len; i += n) {
    var end = (i + n < len) ? i + n : len;
    chunks.add(l.sublist(i, end));
  }
  return chunks;
}

String _toRowContent(List<FormFieldMetaData> l) {}
