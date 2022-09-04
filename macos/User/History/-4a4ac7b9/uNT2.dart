import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';
import 'package:meta/meta.dart' hide literal;

class TextFormFieldController extends FormFieldController {
  const TextFormFieldController();

  @override
  Reference get valueType => refer('String');

  @override
  Reference get controllerType => refer(
        'TextEditingController',
        'package:flutter/material.dart',
      );

  @override
  Expression accessValue(Expression controller) => controller.property('text');

  @override
  Expression invokeController(Expression initialValue) =>
      controllerType.newInstance([], {
        'text': initialValue,
      });

  @override
  Expression invokeController(Expression initialValue) =>
      controllerType.newInstance([], {
        'text': initialValue,
      });
}

class TextFormFieldWidget extends FormPartWidget {
  TextFormFieldWidget({
    this.label,
    this.hint,
    this.validator,
    this.decorations = const {},
    super.parameters,
  });

  final Expression? label;
  final Expression? hint;
  final Expression? validator;
  final Map<String, Expression> decorations;

  @mustCallSuper
  Map<String, Expression> defaultDecoration() => {
        'errorMaxLines': literal(3),
        if (label != null) 'labelText': label!,
        if (hint != null) 'hintText': hint!,
      };

  @override
  @mustCallSuper
  Map<String, Expression> defaultNamedParameters(Expression accessController) =>
      {
        ...super.defaultNamedParameters(accessController),
        'controller': accessController,
        'textInputAction': refer('TextInputAction.next'),
        if (validator != null) 'validator': validator!,
        'decoration': inputDecorations,
      };

  Expression get inputDecorations => refer('InputDecoration').call([], {
        ...defaultDecoration(),
        ...decorations,
      });

  @override
  final Expression widgetType =
      refer('TextFormField', 'package:flutter/material.dart');
}

class TextFormField extends FormField {
  TextFormField(
    super.name, {
    this.label,
    this.hint,
    this.validator,
    this.decorations = const {},
    this.parameters = const {},
  });

  final Expression? label;
  final Expression? hint;
  final Expression? validator;
  final Map<String, Expression> decorations;
  final Map<String, Expression> parameters;

  @override
  TextFormFieldController get controller => const TextFormFieldController();

  @override
  FormPartWidget get widget => TextFormFieldWidget(
        label: label,
        hint: hint,
        validator: validator,
        decorations: decorations,
        parameters: parameters,
      );
}
