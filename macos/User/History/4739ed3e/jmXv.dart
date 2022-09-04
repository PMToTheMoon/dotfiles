import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';

TextFormField multiLineFormField(String name, {required String hint, Expression? validator, bool border = true}) => TextFormField(name, controller: MultiLineFormFieldController(),)

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
        ...defaultNamedParameters(accessController),
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
