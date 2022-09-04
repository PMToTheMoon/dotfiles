import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';

final userAccountFormController = FormController(
  formName: 'UserPersonalInformationForm',
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
      'phone',
      controller: const TextFormFieldController(),
    ),
    FormControllerField(
      'biography',
      controller: const TextFormFieldController(),
    ),
    FormControllerField(
      'password',
      controller: const TextFormFieldController(),
    ),
  ],
);

final user = Path('user/', [
  Path('user_account/widgets', [
    userAccountFormController,
  ]),
]);
