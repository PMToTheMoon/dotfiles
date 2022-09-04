import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';

final userAccountFormController = FormController(
  formName: 'UserPersonalInformationForm',
  fields: [
    FormControllerField('firstName', controller: TextFieldController()),
    FormControllerField('lastName', controller: TextFieldController()),
    FormControllerField('email', controller: TextFieldController()),
    FormControllerField('phone', controller: TextFieldController()),
    FormControllerField('biography', controller: TextFieldController()),
    FormControllerField('password', controller: TextFieldController()),
  ],
);

final user = Path('user/', [
  Path('user_account/widgets/personal_information_form', [
    userAccountFormController,
  ]),
]);
