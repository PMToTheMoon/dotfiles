import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';

class DatePickerFieldController extends FormFieldController {
  DatePickerFieldController() : super();

  @override
  Reference get valueType => refer('DateTime');

  @override
  Reference get controllerType => refer(
        'DateEditingController.yMMM',
        'package:common/common.dart',
      );

  @override
  Expression accessValue(Expression controller) => controller.property('date');

  @override
  Expression invokeController(Expression initialValue) =>
      controllerType.newInstance([], {
        'date': initialValue,
      });
}

class DatePickerWidget extends FormPartWidget {
  DatePickerWidget(this.label);

  final String label;

  @override
  Expression get widgetType => refer('DatePickerFormField');

  @override
  Map<String, Expression> defaultNamedParameters(Expression accessController) =>
      {
        ...super.defaultNamedParameters(accessController),
      };
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
