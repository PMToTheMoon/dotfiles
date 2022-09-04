import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';
import 'package:ipr/ipr.dart';

class TitledSection extends FormSection {
  TitledSection({
    required Expression title,
    required this.spacing,
    Expression? padding,
    Expression? subtitle,
    bool required = false,
    required super.parts,
  });

  final Expression title;
  final Expression spacing;
  final Expression? padding;
  final Expression? subtitle;
  final bool required = false;

  @override
  String get path => '';

  @override
  Expression invokeWidget(
    BuildStep step,
    Expression accessController,
    Iterable<Expression> children,
  ) {
    final section = _buildTitledSection(
      title: title,
      parts: partsMeta,
      subtitle: subtitle,
      required: required,
    );
    if (padding != null) {
      return wrapWithPadding(section, padding);
    }
    return section;
  }

  Expression _buildTitledSection({
    required Expression title,
    required Iterable<Expression> children,
    Expression? subtitle,
    bool required = false,
  }) {
    return refer(
      'TitledSection',
      'package:common/common.dart',
    ).newInstance([], {
      'title': title,
      if (subtitle != null) 'subtitle': subtitle,
      'required': literal(required),
      'child': refer('Column').newInstance(
        [],
        {
          'children': literalList(children),
        },
      )
    });
  }
}
