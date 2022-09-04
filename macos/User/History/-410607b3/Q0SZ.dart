part of 'new_professional_experience_form.dart';

class NewProfessionalExperienceFormController {
  NewProfessionalExperienceFormController({String? test, String? test2})
      : test = TextEditingController(text: test),
        test2 = TextEditingController(text: test2);

  NewProfessionalExperienceFormController.fromSnapshot(
      NewProfessionalExperienceFormSnapshot? initialValue)
      : test = TextEditingController(text: initialValue?.test),
        test2 = TextEditingController(text: initialValue?.test2);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController test;

  final TextEditingController test2;

  bool validate() => formKey.currentState!.validate();
  NewProfessionalExperienceFormSnapshot snapshot() =>
      NewProfessionalExperienceFormSnapshot(test: test.text, test2: test2.text);
}
