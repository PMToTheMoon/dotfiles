import 'package:form_generator/form_generator.dart';
import 'package:ipr/ipr.dart';

final loginFormController = FormController(
  formName: 'LoginForm',
  fields: [
    FormControllerField('email', controller: TextFieldController()),
    FormControllerField('password', controller: TextFieldController()),
    FormControllerField('saveCredentials',
        controller: CheckboxFieldController()),
  ],
);
