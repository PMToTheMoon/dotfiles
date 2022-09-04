import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';

const multiLineFormFieldTemplate = '''
MultiLineTextFormField(
  controller: _controller.{{ controller }},
  textInputAction: TextInputAction.next,
  hint: {{ hint }},
  {{# validator }}
    validator: {{ validator }},
  {{/ validator }}
)''';

class MultiLineFormField extends TextFormField {
  MultiLineFormField(
    super.name, {
    super.hint,
    super.validator,
  });

  @override
  InvokeExpression get invokeWidget => InvokeExpression.newOf(
        refer('MultiLineTextFormField', 'package:common/common.dart'),
        [],
        {
          'controller': refer('_controller.$name'),
          'textInputAction': refer('TextInputAction.next'),
          if (validator != null) 'validator': validator!,
          'decoration': decorations,
        },
      );
}
