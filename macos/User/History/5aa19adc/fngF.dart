import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';
import 'package:intersperse/intersperse.dart';

class ColumnFormSection extends FormSection {
  ColumnFormSection({
    required super.parts,
    required this.spacing,
    required this.horizontalSpacing,
    bool required = false,
  });

  final Expression spacing;
  final Expression horizontalSpacing;

  @override
  String get path => '';

  @override
  Iterable<Expression> invokeWidgets(
    BuildStep step,
    Expression accessController,
    Iterable<Expression> children,
  ) {
    final chunks = _split(children.toList(), 2);
    final rows = chunks
        .map((fieldList) => _toRowContent(fieldList, horizontalSpacing))
        .map(
          (content) => refer('Row').newInstance([], {
            'crossAxisAlignment': refer('CrossAxisAlignment.start'),
            'children': literalList(content),
          }),
        );
    final content = intersperse(spacing, rows);
    return content;
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
  Iterable<Expression> children,
  Expression horizontalSpacing,
) {
  final widgets = children.map((child) => refer('Expanded').newInstance([], {
        'child': child,
      }));
  return intersperse(horizontalSpacing, widgets);
}

// class ColumnFormSection extends WrappedFormSection {
//   ColumnFormSection({
//     required Expression title,
//     required super.fields,
//     required super.spacing,
//     required Expression horizontalSpacing,
//     bool required = false,
//   }) : super(wrapper: (metaData) {
//           final chunks = _split(metaData, 2);
//           final rows = chunks
//               .map((fieldList) => _toRowContent(fieldList, horizontalSpacing))
//               .map(
//                 (content) => refer('Row').newInstance([], {
//                   'crossAxisAlignment': refer('CrossAxisAlignment.start'),
//                   'children': literalList(content),
//                 }),
//               );
//           final content = intersperse(spacing, rows);
//           return InvokeExpression.newOf(
//               refer('TitledSection', 'package:common/common.dart'), [], {
//             'title': title,
//             'required': literal(required),
//             'child': refer('Column').newInstance([], {
//               'children': literalList(content),
//             })
//           });
//         });
// }

// List<List<T>> _split<T>(List<T> l, int n) {
//   final len = l.length;
//   final List<List<T>> chunks = [];

//   for (int i = 0; i < len; i += n) {
//     var end = (i + n < len) ? i + n : len;
//     chunks.add(l.sublist(i, end));
//   }
//   return chunks;
// }

// Iterable<Expression> _toRowContent(
//   List<FormFieldMetaData> fields,
//   Expression horizontalSpacing,
// ) {
//   final widgets = fields.map((f) => refer('Expanded').newInstance([], {
//         'child': f.invokeWidget,
//       }));
//   return intersperse(horizontalSpacing, widgets);
// }
