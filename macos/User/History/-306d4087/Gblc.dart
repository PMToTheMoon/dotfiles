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
  Reference get type => refer('Set<String>');

  @override
  Reference get controller =>
      refer('ChipSelectorController', 'package:common/common.dart');

  @override
  Expression get getValue => refer('$name.value');

  @override
  Expression get invokeController => controller.newInstance([], {
        'value': refer('initialValue?.$name'),
      });

  @override
  Expression get invokeWidget => throw UnimplementedError();
}
