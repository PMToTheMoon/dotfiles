part of 'observation_form.dart';class ObservationFormController {ObservationFormController({ObservationFormSnapshot? initialValue}) : TextEditingController(text: initialValue?.name) = name, TextEditingController(text: initialValue?.lastName) = lastName;

final String name;

final String lastName;

bool validate() => _formKey.currentState!.validate();
ObservationFormSnapshot snapshot() => ObservationFormSnapshot(name: name.text, lastName: lastName.text);
 }
