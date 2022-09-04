import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';

class CheckboxFieldController extends FormFieldController {
  CheckboxFieldController() : super();

  @override
  Reference get valueType => refer('bool');

  @override
  Reference get controllerType => refer(
        'CheckboxFieldController',
        'package:common/common.dart',
      );

  @override
  Expression accessValue(Expression controller) => controller.property('value');

  @override
  Expression invokeController(Expression initialValue) =>
      controllerType.newInstance([
        initialValue,
      ]);
}

class TbtTextField extends TextFormField {
  TbtTextField(
    super.name, {
    super.label,
    super.hint,
    super.validator,
    super.decorations,
    super.parameters,
  });

  @override
  FormPartWidget get widget => TbtTextFieldWidget(
        label: label,
        hint: hint,
        validator: validator,
        decorations: decorations,
        parameters: parameters,
      );
}
