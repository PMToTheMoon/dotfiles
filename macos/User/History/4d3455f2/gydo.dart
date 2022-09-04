import 'dart:async';

import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/src/from_controller/form_controller.dart';

class FormFieldControllerMetaData {
  final Expression invoke;
}

/// Represent the controller of a form field that hold a value T
///
/// This can probably be generalized to every kind of widget controller
abstract class FormFieldController extends MetaObject {
  FormFieldController({
    required this.fieldName,
    required this.controller,
    required this.getValue,
  });

  final String fieldName;
  final Reference controller;
  final Expression getValue;

  /// initialize controller using initial value
  Expression invokeController(Expression initialValue);

  @override
  FutureOr build(BuildStep step) {
  
    final invoke = refer(fieldName).assign(
      invokeController
    )


    throw UnimplementedError();
  }
}
