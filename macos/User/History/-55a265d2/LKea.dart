import 'package:bonemeal/bonemeal.dart';

class CheckboxFieldController extends FormFieldController {
  CheckboxFieldController() : super();

  Reference get valueType => refer('bool');

  Reference get controllerType => refer(
        'CheckboxFieldController',
        'package:common/common.dart',
      );

  @override
  Expression accessValue(Expression controller) => controller.property('value');

  @override
  Expression invokeController(Expression initialValue) =>
      controllerType.newInstance([
        initialValue,
      ]);
}
