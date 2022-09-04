import 'package:form_generator/form_generator.dart';

final candidateInformationController = FormController(
  formName: 'SignInForm',
  fields: [
    FormControllerField('firstName', controller: TextFieldController()),
    FormControllerField('lastName', controller: TextFieldController()),
    FormControllerField('email', controller: TextFieldController()),
    FormControllerField('password', controller: TextFieldController()),
  ],
);
