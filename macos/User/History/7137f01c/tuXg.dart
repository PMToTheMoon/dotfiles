import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';
import 'package:intersperse/intersperse.dart';

class ColumnFormSection extends WrappedFormSection {
  ColumnFormSection({
    required Expression title,
    required super.fields,
    required super.spacing,
    required Expression horizontalSpacing,
    bool required = false,
  }) : super(wrapper: (metaData) {
          final chunks = _split(metaData, 2);
          // final rows = chunks
          //     .map((fieldList) => _toRowContent(fieldList, horizontalSpacing))
          //     .map((content) => 'Row(children: [$content,])')
          //     .join(',$spacing,');
          final rows = chunks
              .map((fieldList) => _toRowContent(fieldList, horizontalSpacing))
              .map((content) => 'Row(children: [$content,])')
              .join(',$spacing,');
          final content = intersperse(spacing, rows);
          return InvokeExpression.newOf(
              refer('FormSection', 'package:common/common.dart'), [], {
            'title': title,
            'required': literal(required),
          });
        });
}

class _ColumnFormSection extends FormSection {
  _ColumnFormSection({
    required this.title,
    required this.required,
    required super.fields,
    this.columnNumber = 2,
  }) : super(
          spacing: refer('const SpaceSmaller.h()'),
        );

  final String title;
  final bool required;
  final int columnNumber;
  final Expression horizontalSpacing = refer('const SpaceSmaller.w()');

  @override
  Future<FormSectionMetaData> build(BuildStep step) async {
    final fieldsMetaData = await Future.wait(
      fields.map((f) async => f.build(step)),
    );
    final chunks = _split(fieldsMetaData, 2);
    final rows = chunks
        .map((fieldList) => _toRowContent(fieldList, horizontalSpacing))
        .map(
          (content) => refer('Row').newInstance([], {
            'children': literalList(content),
          }),
        );

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

Iterable<Expression> _toRowContent(
  List<FormFieldMetaData> fields,
  Expression horizontalSpacing,
) {
  final widgets = fields.map((f) => refer('Expanded').newInstance([], {
        'child': f.invokeWidget,
      }));
  return intersperse(horizontalSpacing, widgets);
}
