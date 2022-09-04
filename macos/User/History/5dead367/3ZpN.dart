import 'package:bonemeal/bonemeal.dart';

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
        'bool': initialValue,
      });
}
