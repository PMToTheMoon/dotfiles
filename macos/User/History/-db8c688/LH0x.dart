part of 'observation_form.dart';

class ObservationFormController {
  ObservationFormController({ObservationFormSnapshot? initialValue})
      : name = TextEditingController(text: initialValue?.name),
        lastName = TextEditingController(text: initialValue?.lastName);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController name;

  final TextEditingController lastName;

  bool validate() => _formKey.currentState!.validate();
  ObservationFormSnapshot snapshot() =>
      ObservationFormSnapshot(name: name.text, lastName: lastName.text);
}
