import 'package:code_builder/src/specs/expression.dart';
import 'package:bonemeal_core/src/meta_object/build_step.dart';
import 'package:form_generator/form_generator.dart';

class BodyTextSection extends FormSection {
  @override
  String get path => '';

  @override
  Iterable<Expression> invokeWidgets(
    BuildStep step,
    Expression accessController,
    Iterable<Expression> children,
  ) {
    // TODO: implement invokeWidgets
    throw UnimplementedError();
  }
}
