import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';

class ChipEditorFormFieldController extends FormFieldController {
  @override
  Expression accessValue(Expression controller) => controller.property('value');

  @override
  Reference get controllerType =>
      refer('ChipEditingController', 'package:common/common.dart');

  @override
  Expression invokeController(Expression initialValue) =>
      controllerType.newInstance([], {'value': initialValue});

  @override
  Reference get valueType => refer('Set<String>');
}

class ChipEditorFormFieldWidget extends FormPartWidget {
  ChipEditorFormFieldWidget({
    required this.label,
  });

  final Expression label;

  @override
  Map<String, Expression> defaultNamedParameters(Expression accessController) =>
      {
        ...super.defaultNamedParameters(accessController),
        'label': label,
      };

  @override
  Expression get widgetType =>
      refer('ChipEditorFormField', 'package:common/common.dart');
}

class ChipEditorFormField extends FormField {
  ChipEditorFormField(
    super.name, {
    required this.label,
  });

  final Expression label;

  @override
  FormFieldController get controller => ChipEditorFormFieldController();

  @override
  FormPartWidget get widget => ChipEditorFormFieldWidget(label: label);
}
