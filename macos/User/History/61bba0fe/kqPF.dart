import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';

export 'form_field.dart';
export 'form_section.dart';

class FormPartMetaData {
  const FormPartMetaData({
    required this.name,
    required this.invokeWidget,
    required this.controllerFields,
  });

  final String name;
  final Expression Function(Expression accessController) invokeWidget;
  final Iterable<FormControllerField> controllerFields;
}

abstract class FormPartWidget {
  FormPartWidget({this.parameters = const {}});

  final Map<String, Expression> parameters;

  List<Expression> positionalParameters(Expression accessController) => [];

  Map<String, Expression> defaultNamedParameters(Expression accessController) =>
      {};

  @override
  Expression invokeWidget(Expression accessController) {
    return InvokeExpression.newOf(
      refer(
        'TextFormField',
        'package:flutter/material.dart',
      ),
      positionalParameters(accessController),
      {
        ...defaultNamedParameters(accessController),
        ...parameters,
      },
    );
  }
}

abstract class FormPart extends MetaObject<FormPartMetaData> {}
