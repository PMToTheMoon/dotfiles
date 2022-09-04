import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';

TextFormField textFormField(
  String name, {
  Expression? label,
  Expression? hint,
  Expression? validator,
  Map<String, Expression> decorations = const {},
  Map<String, Expression> parameters = const {},
}) =>
    IntFormField(
      name,
      widget: IntFormFieldWidget(
        label: label,
        hint: hint,
        validator: validator,
        decorations: decorations,
        parameters: parameters,
      ),
    );

class IntFormFieldController extends TextFormFieldController {
  IntFormFieldController({
    this.nullable = true,
  });

  final bool nullable;

  @override
  Reference get valueType => nullable ? refer('int?') : refer('int');

  @override
  Expression accessValue(Expression controller) => nullable
      ? refer('int.tryParse').call([controller.property('text')])
      : refer('int.parse').call([controller.property('text')]);

  @override
  Expression invokeController(Expression initialValue) =>
      controllerType.newInstance([], {
        'text': initialValue.property('toString').call([]),
      });
}

class IntFormFieldWidget extends TextFormFieldWidget {
  IntFormFieldWidget({
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
            '<TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]',
            'package:flutter/services.dart'),
      };
}

class IntFormField extends TextFormField {
  IntFormField(
    super.name, {
    TextFormFieldWidget? widget,
    TextFormFieldController? controller,
  }) : super(
          widget: widget ?? IntFormFieldWidget(),
          controller: controller ?? DoubleFormFieldController(),
        );
}
