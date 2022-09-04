import 'package:bonemeal/bonemeal.dart';

/// Represent the controller of a form field that hold a value T
///
/// This can probably be generalized to every kind of widget controller
class FormFieldController {
  FormFieldController({
    required this.controller,
    required this.getValue,
    required this.invokeController,
  });

  final Reference controller;
  final Expression getValue;
  final Expression invokeController;
}
