import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';
import 'package:meta/meta.dart';

export 'form_field.dart';
export 'form_section.dart';

class FormPartMetaData {
  const FormPartMetaData({
    // required this.name,
    required this.invokeWidget,
    required this.controllerFields,
  });

  // final String name;
  final Expression Function(Expression accessController) invokeWidget;
  final Iterable<FormControllerField> controllerFields;
}

abstract class FormPartWidget {
  FormPartWidget({this.parameters = const {}});

  final Map<String, Expression> parameters;

  Expression get widgetType;

  @mustCallSuper
  List<Expression> positionalParameters(Expression accessController) => [];

  @mustCallSuper
  Map<String, Expression> defaultNamedParameters(Expression accessController) =>
      {};

  Expression invokeWidget(Expression accessController) {
    return widgetType.call(
      positionalParameters(accessController),
      {
        ...defaultNamedParameters(accessController),
        ...parameters,
      },
    );
  }
}

typedef FormPart = MetaObject<FormPartMetaData>;
