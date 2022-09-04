part of 'general_initial_observation_form.dart';

class GeneralInitialObservationFormController {
  GeneralInitialObservationFormController(
      {GeneralInitialObservationFormSnapshot? initialValue})
      : title = TextEditingController(text: initialValue?.title),
        hiddenReason = TextEditingController(text: initialValue?.hiddenReason),
        patientReason =
            TextEditingController(text: initialValue?.patientReason),
        weight = TextEditingController(text: initialValue?.weight.toString()),
        height = TextEditingController(text: initialValue?.height.toString()),
        pas = TextEditingController(text: initialValue?.pas.toString()),
        pad = TextEditingController(text: initialValue?.pad.toString()),
        temperature =
            TextEditingController(text: initialValue?.temperature.toString()),
        heartRate =
            TextEditingController(text: initialValue?.heartRate.toString()),
        medicalHistory =
            ChipEditingController(value: initialValue?.medicalHistory),
        symptoms = ChipEditingController(value: initialValue?.symptoms),
        treatment = ChipEditingController(value: initialValue?.treatment),
        additionalObservation =
            TextEditingController(text: initialValue?.additionalObservation);

  final _formKey = GlobalKey<FormState>();

  final TextEditingController title;

  final TextEditingController hiddenReason;

  final TextEditingController patientReason;

  final TextEditingController weight;

  final TextEditingController height;

  final TextEditingController pas;

  final TextEditingController pad;

  final TextEditingController temperature;

  final TextEditingController heartRate;

  final ChipEditingController medicalHistory;

  final ChipEditingController symptoms;

  final ChipEditingController treatment;

  final TextEditingController additionalObservation;

  bool validate() => _formKey.currentState!.validate();
  GeneralInitialObservationFormSnapshot snapshot() =>
      GeneralInitialObservationFormSnapshot(
          title: title.text,
          hiddenReason: hiddenReason.text,
          patientReason: patientReason.text,
          weight: int.parse(weight.text),
          height: int.parse(height.text),
          pas: int.tryParse(pas.text),
          pad: int.tryParse(pad.text),
          temperature: double.tryParse(temperature.text),
          heartRate: int.tryParse(heartRate.text),
          medicalHistory: medicalHistory.value,
          symptoms: symptoms.value,
          treatment: treatment.value,
          additionalObservation: additionalObservation.text);
}
