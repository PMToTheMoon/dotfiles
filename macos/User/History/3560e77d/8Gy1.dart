import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';

class ColumnFormSection extends FormSection {
  const ColumnFormSection({
    required this.title,
    required this.required,
    required super.fields,
    this.horizontalSpacing = 'const SpaceSmaller.w()',
    super.spacing = 'const SpaceSmaller.h()',
    this.columnNumber = 2,
  });

  final String title;
  final bool required;
  final int columnNumber;
  final String horizontalSpacing;

  @override
  Future<FormSectionMetaData> build(BuildStep step) async {
    final fieldsMetaData = await Future.wait(
      fields.map((f) async => f.build(step)),
    );
    final chunks = _split(fieldsMetaData, 2);
    final rows = chunks
        .map((fieldList) => _toRowContent(fieldList, horizontalSpacing))
        .map((content) => 'Row(children: [$content])')
        .join(',');
    return FormSectionMetaData(
      fields: fieldsMetaData,
      instantiate: '''
FormSection(
  title: $title,
  required: $required,
  children: [
    $rows
  ],
)
''',
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

String _toRowContent(List<FormFieldMetaData> l, String horizontalSpacing) => l
    .map((f) => 'Expanded(child: ${f.widgetDeclaration})')
    .join(',$horizontalSpacing,');
