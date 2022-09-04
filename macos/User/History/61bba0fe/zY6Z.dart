import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';

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
  Expression invokeWidget(Expression accessController);
}

abstract class FormPart extends MetaObject<FormPartMetaData> {}
