import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';
import 'package:ipr/ipr.dart';

class WrapSectionWithPadding extends FormSection {
  WrapSectionWithPadding({
    required this.child,
    this.padding,
  });

  final Expression? padding;
  final FormPart child;

  @override
  // TODO: implement path
  String get path => throw UnimplementedError();

  @override
  Iterable<Expression> widgetInvocations(BuildStep step,
      Expression accessController, Iterable<Expression> children) {
    // TODO: implement widgetInvocations
    throw UnimplementedError();
  }
}
