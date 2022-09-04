import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';

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
          'controller': referController,
          'textInputAction': refer('TextInputAction.next'),
          'hint': hint,
          if (validator != null) 'validator': validator!,
        },
      );
}
