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
  TypeReference get controller => TypeReference((t) => 'ChipEditingController');

  @override
  // TODO: implement getValue
  Expression get getValue => throw UnimplementedError();

  @override
  // TODO: implement invokeController
  InvokeExpression get invokeController => throw UnimplementedError();

  @override
  // TODO: implement invokeWidget
  InvokeExpression get invokeWidget => throw UnimplementedError();

  @override
  // TODO: implement type
  TypeReference get type => throw UnimplementedError();
}
