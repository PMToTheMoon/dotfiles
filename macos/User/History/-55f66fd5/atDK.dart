import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';

class DoubleFormFieldController extends TextFormFieldController {
  DoubleFormFieldController({
    this.nullable = true,
  });

  final bool nullable;

  @override
  Reference get valueType => nullable ? refer('double?') : refer('double');

  @override
  Expression accessValue(Expression controller) => nullable
      ? refer('double.tryParse').call([controller.property('text')])
      : refer('double.parse').call([controller.property('text')]);

  @override
  Expression invokeController(Expression initialValue) =>
      controllerType.newInstance([], {
        'text': initialValue.property('toString').call([]),
      });
}

class DoubleFormFieldWidget extends TextFormFieldWidget {
  DoubleFormFieldWidget({
    super.label,
    super.hint,
    super.validator,
    super.decorations = const {},
    super.parameters,
  });

  @override
  Map<String, Expression> defaultNamedParameters(Expression accessController) =>
      {
        ...super.defaultNamedParameters(accessController),
        'keyboardType': refer('TextInputType.number'),
        'inputFormatters': refer(
          "[FilteringTextInputFormatter.allow(RegExp(r'[0-9|.]'))]",
          'package:flutter/services.dart',
        ),
      };
}

class DoubleFormField extends TextFormField {
  DoubleFormField(
    super.name, {
    super.label,
    super.hint,
    super.validator,
    super.decorations = const {},
    super.parameters = const {},
  });

  @override
  get controller => DoubleFormFieldController();
}
