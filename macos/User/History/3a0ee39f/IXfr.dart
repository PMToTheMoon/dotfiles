import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';
import 'package:ipr/ipr.dart';

final generalInitialObservationForm = Path(
  'lib/record/initial_observation/general/widgets/',
  [
    Form(
      subject: 'GeneralInitialObservation',
      spacing: outerSectionSpacing,
      parts: [
        TitledSection(
          title: 'record_title'.tr,
          spacing: innerSectionSpacing,
          required: true,
          parts: [
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
            parts: [
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
            parts: [
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
          parts: [
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
          parts: [
            ChipEditorFormField(
              'medicalHistory',
              label: 'medical_history_hint'.tr,
            ),
          ],
        ),
        TitledSection(
          title: 'symptoms_title'.tr,
          spacing: innerSectionSpacing,
          parts: [
            ChipEditorFormField(
              'symptoms',
              label: 'symptoms_hint'.tr,
            ),
          ],
        ),
        TitledSection(
          title: 'treatment_title'.tr,
          spacing: innerSectionSpacing,
          parts: [
            ChipEditorFormField(
              'treatment',
              label: 'treatment_hint'.tr,
            ),
          ],
        ),
        TitledSection(
          title: 'additional_observation_title'.tr,
          spacing: innerSectionSpacing,
          parts: [
            MultiLineFormField(
              'additional_observation',
              hint: 'additional_observation_hint'.tr,
            ),
          ],
        ),
      ],
    ),
  ],
);
