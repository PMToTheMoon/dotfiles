import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';
import 'package:form_generator/src/form_controller/form_field_controller.dart';

class TextFormFieldController extends FormPartController {
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
}

class TextFormFieldWidget extends FormPartWidget {
  TextFormFieldWidget({
    this.label,
    this.hint,
    this.validator,
    this.parameters = const {},
    this.decorations = const {},
  });

  final Expression? label;
  final Expression? hint;
  final Expression? validator;
  final Map<String, Expression> parameters;
  final Map<String, Expression> decorations;

  Map<String, Expression> defaultDecoration() => {
        'errorMaxLines': literal(3),
        if (label != null) 'labelText': label!,
        if (hint != null) 'labelText': hint!,
      };

  Map<String, Expression> defaultDecoration() => {
        'errorMaxLines': literal(3),
        if (label != null) 'labelText': label!,
        if (hint != null) 'labelText': hint!,
      };

  Expression get inputDecorations => InvokeExpression.newOf(
        refer('InputDecoration'),
        [],
        {
          ...defaultDecoration(),
          ...decorations,
        },
      );

  @override
  Expression invokeWidget(Expression accessController) {
    return InvokeExpression.newOf(
      refer(
        'TextFormField',
        'package:flutter/material.dart',
      ),
      [],
      {
        'controller': accessController,
        'textInputAction': refer('TextInputAction.next'),
        if (validator != null) 'validator': validator!,
        'decoration': inputDecorations,
        ...parameters,
      },
    );
  }
}

class TextFormField extends Seed<FormPartMetaData> {
  TextFormField(
    this.name, {
    FormPartController? controller,
    FormPartWidget? widget,
  })  : controller = controller ?? TextFormFieldController(),
        widget = widget ?? TextFormFieldWidget();

  final String name;
  final FormPartController controller;
  final FormPartWidget widget;

  @override
  MetaObject<FormPartMetaData> grow(BuildContext context) {
    return FormField(
      name: name,
      controller: controller,
      widget: widget,
    );
  }
}
