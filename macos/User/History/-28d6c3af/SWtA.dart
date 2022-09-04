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
  DatePickerWidget({this.label});

  final Expression? label;

  @override
  Expression get widgetType => refer('DatePickerFormField');

  @override
  Map<String, Expression> defaultNamedParameters(Expression accessController) =>
      {
        ...super.defaultNamedParameters(accessController),
        if (label != null) 'label': label!,
      };
}

class TbtTextField extends FormField {
  TbtTextField(
    super.name, {
    this.label,
  });

  final Expression? label;

  @override
  FormPartWidget get widget => DatePickerWidget(
        label: label,
      );

  @override
  FormFieldController get controller => DatePickerFieldController();
}
