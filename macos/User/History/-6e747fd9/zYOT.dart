import 'package:bonemeal/bonemeal.dart';

/// Represent the controller of a form field that hold a value T
///
/// This can probably be generalized to every kind of widget controller
abstract class FormPartController {
  Reference get valueType;
  Reference get controllerType;
  Expression accessValue(Expression controller);
  Expression invokeController(Expression initialValue);
}
