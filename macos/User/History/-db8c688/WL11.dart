part of 'observation_form.dart';

class ObservationFormController {
  ObservationFormController({ObservationFormSnapshot? initialValue})
      : name = TextEditingController(text: initialValue?.name),
        lastName = TextEditingController(text: initialValue?.lastName);

  final String name;

  final String lastName;

  bool validate() => _formKey.currentState!.validate();
  ObservationFormSnapshot snapshot() =>
      ObservationFormSnapshot(name: name.text, lastName: lastName.text);
}
