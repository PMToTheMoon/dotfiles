import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';

class MultiLineFormField extends FormField {
  MultiLineFormField(
    super.name, {
    required Expression hint,
    super.validator,
  });

  @override
  InvokeExpression get invokeWidget => InvokeExpression.newOf(
        refer('MultiLineTextFormField', 'package:common/common.dart'),
        [],
        {
          'controller': referController,
          'textInputAction': refer('TextInputAction.next'),
          'hint': hint!,
          if (validator != null) 'validator': validator!,
        },
      );

  @override
  // TODO: implement controller
  Reference get controller => throw UnimplementedError();

  @override
  // TODO: implement getValue
  Expression get getValue => throw UnimplementedError();

  @override
  // TODO: implement invokeController
  Expression get invokeController => throw UnimplementedError();

  @override
  // TODO: implement type
  Reference get type => throw UnimplementedError();
}
