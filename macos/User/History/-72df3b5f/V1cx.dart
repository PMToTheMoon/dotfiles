import 'package:form_generator/form_generator.dart';

final userAccountFormController = FormController(
  formName: 'UserAccountForm',
  fields: [
    FormControllerField('firstName', controller: TextFieldController()),
    FormControllerField('lastName', controller: TextFieldController()),
    FormControllerField('email', controller: TextFieldController()),
    FormControllerField('phone', controller: TextFieldController()),
    FormControllerField('password', controller: TextFieldController()),
  ],
);
