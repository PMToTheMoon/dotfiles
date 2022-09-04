import 'package:form_generator/form_generator.dart';

final loginFormController = FormController(
  formName: 'LoginForm',
  fields: [
    FormControllerField('email', controller: const TextFormFieldController()),
    FormControllerField('password',
        controller: const TextFormFieldController()),
  ],
);
