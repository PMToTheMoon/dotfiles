import 'package:code_builder/src/specs/field.dart';
import 'package:code_builder/src/specs/expression.dart';
import 'package:form_generator/form_generator.dart';
import 'package:form_generator/src/form_controller/form_field_controller.dart';

class TextFieldController extends FormFieldController {
  TextFieldController(
    super.fieldName, {
    required super.controller,
    required super.getValue,
  }) : super(
          fieldName: fieldName,
        );

  @override
  Expression accessValue() {
    // TODO: implement accessValue
    throw UnimplementedError();
  }

  @override
  Field fieldDeclaration(String name) {
    // TODO: implement fieldDeclaration
    throw UnimplementedError();
  }

  @override
  Expression invokeController(Expression initialValue) {
    // TODO: implement invokeController
    throw UnimplementedError();
  }
}
