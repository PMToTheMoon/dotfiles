import 'package:code_builder/src/specs/reference.dart';
import 'package:code_builder/src/specs/expression.dart';
import 'package:form_generator/form_generator.dart';

class ChipSelectorFormField extends FormField {
  ChipSelectorFormField(
    super.name, {
    required this.label,
  });

  final String label;

  @override
  Reference get controller =>
      refer('ChipSelectorController', 'package:common/common.dart');

  @override
  Expression get getValue => throw UnimplementedError();

  @override
  Expression get invokeController => throw UnimplementedError();

  @override
  Expression get invokeWidget => throw UnimplementedError();

  @override
  Reference get type => throw UnimplementedError();
}
