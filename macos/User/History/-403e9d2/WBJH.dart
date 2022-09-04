import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';

class TbtTextFieldWidget extends TextFormFieldWidget {
  @override
  Expression get widgetType =>
      refer('TbtTextFormField', 'package:common/common.dart');
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
