import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/src/form_fields/form_field.dart';

class ChipEditorFormField extends FormField {
  ChipEditorFormField(
    super.name, {
    this.label,
  });

  final String? label;

  @override
  FormFieldMetaData build(BuildStep context) {
    return FormFieldMetaData(
      valueName: name,
      valueType: 'Set<String>',
      controllerType: 'ChipEditingController',
      controllerInitialization:
          'ChipEditingController(value: initialValue?.$name)',
      accessDataFromController: '$name.value',
      widgetDeclaration: '''
ChipEditorFormField(
  controller: _controller.$name,
  label: $label,
)''',
    );
  }

  @override
  // TODO: implement controller
  Reference get controller =>
      refer('ChipEditingController', 'package:common/common.dart');

  @override
  // TODO: implement getValue
  Expression get getValue => refer('$name.value');

  @override
  // TODO: implement invokeController
  Expression get invokeController => refer('ChipEditingController').newInstance(
        [],
        {'value': refer('initialValue?.$name')},
      );

  @override
  // TODO: implement invokeWidget
  Expression get invokeWidget => refer('ChipEditorFormField').newInstance([], {
        controller: _controller.$name,
        label: $label,
      });

  @override
  // TODO: implement type
  Reference get type => throw UnimplementedError();
}
