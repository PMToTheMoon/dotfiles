import 'dart:async';

import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/src/from_controller/form_controller.dart';


class FormFieldMetaData {
  final Expression invoke
}

/// Represent the controller of a form field that hold a value T
///
/// This can probably be generalized to every kind of widget controller
class FormFieldController extends MetaObject {
  FormFieldController({
    required this.fieldName,
    required this.controller,
    required this.getValue,
    required this.invokeController,
  });

  final String fieldName;
  final Reference controller;
  final Expression getValue;
  final Expression invokeController;

  @override
  FutureOr build(BuildStep step) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
