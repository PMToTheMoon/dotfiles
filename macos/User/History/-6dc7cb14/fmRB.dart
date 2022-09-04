import 'package:form_generator/form_generator.dart';
import 'package:ipr/ipr.dart';

final generalInitialObservationForm = Form.multiSectional(
  root: 'lib/record/initial_observation/general/widgets/',
  subject: 'GeneralInitialObservation',
  spacing: outerSectionSpacing,
  sections: [
    TitledSection(
      title: 'record_title'.tr,
      spacing: innerSectionSpacing,
      required: true,
      fields: [
        TextFormField(
          'title',
          label: 'record_title_hint'.tr,
          validator: requiredValidator,
        ),
      ],
    ),
    TitledSection(
        title: 'hidden_observation_title'.tr,
        subtitle: 'hidden_observation_subtitle'.tr,
        spacing: innerSectionSpacing,
        fields: [
          MultiLineFormField(
            'hiddenReason',
            hint: 'hidden_observation_hint'.tr,
            validator: hiddenReasonValidator,
          ),
        ]),
    TitledSection(
        title: 'patient_observation_title'.tr,
        subtitle: 'patient_observation_subtitle'.tr,
        spacing: innerSectionSpacing,
        fields: [
          MultiLineFormField(
            'patientReason',
            hint: 'patient_observation_hint'.tr,
            validator: patientReasonValidator,
          ),
        ]),
    ColumnFormSection(
      title: 'clinical_exam_title'.tr,
      spacing: innerSectionSpacing,
      horizontalSpacing: horizontalSpacing,
      required: true,
      fields: [
        IntFormField(
          'weight',
          label: 'weight_hint'.tr,
          validator: requiredValidator,
          nullable: false,
        ),
        IntFormField(
          'height',
          label: 'height_hint'.tr,
          validator: requiredValidator,
          nullable: false,
        ),
        IntFormField('pas', label: 'pas_hint'.tr),
        IntFormField('pad', label: 'pad_hint'.tr),
        DoubleFormField('temperature', label: 'temperature_hint'.tr),
        IntFormField('heartRate', label: 'heart_rate_hint'.tr),
      ],
    ),
    TitledSection(
      title: 'medical_history_title'.tr,
      spacing: innerSectionSpacing,
      fields: [
        ChipEditorFormField(
          'medicalHistory',
          label: 'medical_history_hint'.tr,
        ),
      ],
    ),
    TitledSection(
      title: 'symptoms_title'.tr,
      spacing: innerSectionSpacing,
      fields: [
        ChipEditorFormField(
          'symptoms',
          label: 'symptoms_hint'.tr,
        ),
      ],
    ),
    TitledSection(
      title: 'treatment_title'.tr,
      spacing: innerSectionSpacing,
      fields: [
        ChipEditorFormField(
          'treatment',
          label: 'treatment_hint'.tr,
        ),
      ],
    ),
    TitledSection(
      title: 'additional_observation_title'.tr,
      spacing: innerSectionSpacing,
      fields: [
        MultiLineFormField(
          'additional_observation',
          hint: 'additional_observation_hint'.tr,
        ),
      ],
    ),
  ],
);
