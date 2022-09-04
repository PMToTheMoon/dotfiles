import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';
import 'package:form_generator/src/form_controller/form_field_controller.dart';
import 'package:meta/meta.dart' hide literal;

TextFormField textFormField(
  String name, {
  Expression? label,
  Expression? hint,
  Expression? validator,
  Map<String, Expression> decorations = const {},
  Map<String, Expression> parameters = const {},
}) =>
    TextFormField(
      name,
      widget: TextFormFieldWidget(
        label: label,
        hint: hint,
        validator: validator,
        decorations: decorations,
        parameters: parameters,
      ),
    );

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
        if (hint != null) 'labelText': hint!,
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
