import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';
import 'package:ipr/ipr.dart';

class WrapSectionWithPadding extends FormSection {
  WrapSectionWithPadding({
    required FormPart child,
    required this.padding,
  }) : super(parts: [child]);

  final Expression padding;

  @override
  String get path => '';

  @override
  Iterable<Expression> widgetInvocations(
    BuildStep step,
    Expression accessController,
    Iterable<Expression> children,
  ) {
    return [wrapWithPadding(children.first, padding)];
  }
}
