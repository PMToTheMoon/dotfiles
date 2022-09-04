part of 'general_initial_observation_form.dart';

class GeneralInitialObservationFormController {
  GeneralInitialObservationFormController(
      {String? title,
      String? hiddenReason,
      String? patientReason,
      int? weight,
      int? height,
      int? pas,
      int? pad,
      double? temperature,
      int? heartRate,
      Set<String>? medicalHistory,
      Set<String>? symptoms,
      Set<String>? treatment,
      String? additionalObservation})
      : title = TextEditingController(text: title),
        hiddenReason = TextEditingController(text: hiddenReason),
        patientReason = TextEditingController(text: patientReason),
        weight = TextEditingController(text: weight.toString()),
        height = TextEditingController(text: height.toString()),
        pas = TextEditingController(text: pas?.toString()),
        pad = TextEditingController(text: pad?.toString()),
        temperature = TextEditingController(text: temperature.toString()),
        heartRate = TextEditingController(text: heartRate.toString()),
        medicalHistory = ChipEditingController(value: medicalHistory),
        symptoms = ChipEditingController(value: symptoms),
        treatment = ChipEditingController(value: treatment),
        additionalObservation =
            TextEditingController(text: additionalObservation);

  GeneralInitialObservationFormController.fromSnapshot(
      GeneralInitialObservationFormSnapshot? initialValue)
      : title = TextEditingController(text: initialValue?.title),
        hiddenReason = TextEditingController(text: initialValue?.hiddenReason),
        patientReason =
            TextEditingController(text: initialValue?.patientReason),
        weight = TextEditingController(text: initialValue?.weight.toString()),
        height = TextEditingController(text: initialValue?.height.toString()),
        pas = TextEditingController(text: initialValue?.pas?.toString()),
        pad = TextEditingController(text: initialValue?.pad?.toString()),
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

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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

  bool validate() => formKey.currentState!.validate();
  GeneralInitialObservationFormSnapshot snapshot() =>
      GeneralInitialObservationFormSnapshot(
          title: title.text,
          hiddenReason: convertToHtml(hiddenReason.text),
          patientReason: convertToHtml(patientReason.text),
          weight: int.parse(weight.text),
          height: int.parse(height.text),
          pas: int.tryParse(pas.text),
          pad: int.tryParse(pad.text),
          temperature: double.tryParse(temperature.text),
          heartRate: int.tryParse(heartRate.text),
          medicalHistory: medicalHistory.value,
          symptoms: symptoms.value,
          treatment: treatment.value,
          additionalObservation: convertToHtml(additionalObservation.text));
}
