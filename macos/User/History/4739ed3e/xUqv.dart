import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';

class MultiLineFormFieldWidget extends FormPartWidget {
  MultiLineFormFieldWidget({
    required this.hint,
    this.validator,
    this.border = true,
  });

  final Expression hint;
  final Expression? validator;
  final bool border;

  @override
  Expression get widgetType =>
      refer('MultiLineTextFormField', 'package:common/common.dart');

  @override
  Map<String, Expression> defaultNamedParameters(Expression accessController) =>
      {
        ...super.defaultNamedParameters(accessController),
        // 'textInputAction': refer('TextInputAction.next'),
        'hint': hint,
        if (border != true) 'border': literal(border),
        if (validator != null) 'validator': validator!,
      };
}

class MultiLineFormFieldController extends TextFormFieldController {
  @override
  Expression accessValue(Expression controller) =>
      refer('convertToHtml').call([controller.property('text')]);
}

class MultiLineFormField extends FormField {
  MultiLineFormField(
    super.name, {
    this.validator,
    this.border = true,
    required this.hint,
  });

  final Expression? validator;
  final bool border;
  final Expression hint;

  @override
  final controller = MultiLineFormFieldController();

  @override
  get widget => MultiLineFormFieldWidget(
        hint: hint,
        validator: validator,
        border: border,
      );
}
