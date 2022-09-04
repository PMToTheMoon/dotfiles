import 'package:bonemeal/bonemeal.dart';

/// Represent the controller of a form field that hold a value T
///
/// This can probably be generalized to every kind of widget controller
abstract class FormFieldController {
  FormFieldController({
    required this.fieldName,
    required this.controller,
    required this.getValue,
  });

  final String fieldName;
  final Reference controller;
  final Expression getValue;

  /// initialize controller using initial value
  Field fieldDeclaration(String name);
  Expression invokeController(Expression initialValue);
  Expression accessValue();
}
