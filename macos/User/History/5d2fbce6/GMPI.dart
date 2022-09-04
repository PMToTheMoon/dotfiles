import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';
import 'package:intersperse/intersperse.dart';
import 'package:ipr/ipr.dart';

class TitledSection extends FormSection {
  TitledSection({
    required super.parts,
    required this.title,
    this.spacing,
    this.padding,
    this.subtitle,
    this.required = false,
  });

  final Expression title;
  final Expression? spacing;
  final Expression? padding;
  final Expression? subtitle;
  final bool required;

  @override
  String get path => '';

  @override
  Iterable<Expression> widgetInvocations(
    BuildStep step,
    Expression accessController,
    Iterable<Expression> children,
  ) {
    if (spacing != null) {
      children = children.intersperse(spacing!);
    }
    final section = _buildTitledSection(
      title: title,
      subtitle: subtitle,
      required: required,
      children: children,
    );
    if (padding != null) {
      return [wrapWithPadding(section, padding)];
    }
    return [section];
  }

  Expression _buildTitledSection({
    required Expression title,
    required Iterable<Expression> children,
    Expression? subtitle,
    bool required = false,
  }) {
    final ref = refer(
      'TitledSection',
      'package:common/common.dart',
    );
    late Expression child;
    if (children.length > 1) {
      child = refer('Column').newInstance(
        [],
        {
          'children': literalList(children),
        },
      );
    } else {
      child = children.first;
    }
    return ref.newInstance([], {
      'title': title,
      if (subtitle != null) 'subtitle': subtitle,
      'required': literal(required),
      'child': child,
    });
  }
}
