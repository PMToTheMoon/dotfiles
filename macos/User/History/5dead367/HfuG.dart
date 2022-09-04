import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/src/form_controller/form_field_controller.dart';

class CheckboxFieldController extends FormFieldController {
  CheckboxFieldController() : super(refer('bool'));

  @override
  Expression accessValue(Expression controller) => controller.property('value');

  @override
  Field fieldDeclaration(String fieldName) => field(
        fieldName,
        refer('CheckboxFieldController', 'package:common/common.dart'),
      );

  @override
  Expression invokeController(Expression initialValue) => refer(
        'CheckboxFieldController',
        'package:common/common.dart',
      ).newInstance([], {
        'value': initialValue,
      });
}
