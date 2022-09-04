import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';

class ChipSelectorFormField extends FormField {
  ChipSelectorFormField(
    super.name, {
    required this.chips,
    required this.label,
  });

  final Set<Expression> chips;
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
  Expression get invokeWidget => refer('ChipEditorFormField').newInstance([], {
        'chips': literal(chips),
        'controller': referController,
      });
}
