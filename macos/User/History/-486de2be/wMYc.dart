import 'package:form_generator/form_generator.dart';

final signInFormController = FormController(
  formName: 'SignInForm',
  fields: [
    FormControllerField(
      'firstName',
      controller: const TextFormFieldController(),
    ),
    FormControllerField(
      'lastName',
      controller: const TextFormFieldController(),
    ),
    FormControllerField(
      'email',
      controller: const TextFormFieldController(),
    ),
    FormControllerField(
      'password',
      controller: const TextFormFieldController(),
    ),
  ],
);
