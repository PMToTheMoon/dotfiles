part of 'new_observation_form.dart';

class NewObservationFormController {
  NewObservationFormController({NewObservationFormSnapshot? initialValue})
      : title = TextEditingController(text: initialValue?.title),
        hiddenReason = TextEditingController(text: initialValue?.hiddenReason),
        patientReason =
            TextEditingController(text: initialValue?.patientReason),
        consultation =
            ChipSelectorController(value: initialValue?.consultation);

  final _formKey = GlobalKey<FormState>();

  final TextEditingController title;

  final TextEditingController hiddenReason;

  final TextEditingController patientReason;

  final ChipSelectorController consultation;

  bool validate() => _formKey.currentState!.validate();
  NewObservationFormSnapshot snapshot() => NewObservationFormSnapshot(
      title: title.text,
      hiddenReason: hiddenReason.text,
      patientReason: patientReason.text,
      consultation: consultation.value);
}
