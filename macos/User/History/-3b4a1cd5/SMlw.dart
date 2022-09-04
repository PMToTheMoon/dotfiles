import 'package:form_generator/form_generator.dart';

final loginFormController = FormController(
  formName: 'LoginForm',
  fields: [
    FormControllerField('email', controller: TextFieldController()),
    FormControllerField('password', controller: TextFieldController()),
  ],
);
