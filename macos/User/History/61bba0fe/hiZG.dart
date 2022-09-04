import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';
import 'package:meta/meta.dart';

export 'form_field.dart';
export 'form_section.dart';
export 'form_decoration.dart';

class FormPartMetaData {
  const FormPartMetaData({
    // required this.name,
    required this.widgetInvocations,
    required this.controllerFields,
  });

  // final String name;
  final Iterable<Expression> Function(Expression accessController)
      widgetInvocations;
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
      {
        'controller': accessController,
      };

  Expression invokeWidget(Expression accessController) => widgetType.call(
        positionalParameters(accessController),
        {
          ...defaultNamedParameters(accessController),
          ...parameters,
        },
      );

  Iterable<Expression> widgetInvocations(Expression accessController) {
    return [invokeWidget(accessController)];
  }
}

typedef FormPart = MetaObject<FormPartMetaData>;
