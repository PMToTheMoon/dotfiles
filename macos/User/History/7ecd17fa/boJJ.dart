import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';
import 'package:ipr/ipr.dart';

class WrapSectionWithPadding extends FormSection {
  WrapSectionWithPadding({
    required this.child,
    this.padding,
  }) : super(parts: [child]);

  final Expression? padding;
  final FormPart child;

  @override
  String get path => '';

  @override
  Iterable<Expression> widgetInvocations(BuildStep step,
      Expression accessController, Iterable<Expression> children) {
    // TODO: implement widgetInvocations
    throw UnimplementedError();
  }
}
