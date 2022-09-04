import 'package:form_generator/form_generator.dart';

final candidateInformationFormController = FormController(
  formName: 'CandidateInformationForm',
  fields: [
    FormControllerField('firstName', controller: TextFieldController()),
    FormControllerField('lastName', controller: TextFieldController()),
    FormControllerField('email', controller: TextFieldController()),
    FormControllerField('telephone', controller: TextFieldController()),
    FormControllerField('password', controller: TextFieldController()),
  ],
);
