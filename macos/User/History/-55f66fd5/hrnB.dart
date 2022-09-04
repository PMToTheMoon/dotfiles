import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';

class DoubleFormFieldController extends TextFormFieldController {
  const DoubleFormFieldController({
    this.nullable = true,
  });

  final bool nullable;

  @override
  Reference get valueType => nullable ? refer('double?') : refer('double');

  @override
  Expression accessValue(Expression controller) => nullable
      ? controllerType.newInstance([], {
          'text': initialValue
              .nullSafeProperty('toString')
              .call([]).ifNullThen(literal(null)),
        })
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
    this.nullable = true,
  });

  final bool nullable;

  @override
  DoubleFormFieldController get controller =>
      DoubleFormFieldController(nullable: nullable);

  @override
  DoubleFormFieldWidget get widget => DoubleFormFieldWidget(
        label: label,
        hint: hint,
        validator: validator,
        decorations: decorations,
        parameters: parameters,
      );
}
