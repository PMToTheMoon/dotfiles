import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';
import 'package:ipr/ipr.dart';

final _hPadding =
    refer('const PaddingSmallest.horizontal()', 'package:common/common.dart');

final newObservationForm = Form.multiSectional(
  root: 'packages/common/lib/src/widgets/observation/new_observation_card',
  subject: 'NewObservation',
  spacing: outerSectionSpacing,
  sections: [
    SpreadFormSection(spacing: innerSectionSpacing, fields: [
      TextFormField('title', label: 'record_title'.tr),
    ]),
    TitledSection(
      title: 'hidden_observation_title'.tr,
      spacing: innerSectionSpacing,
      padding: _hPadding,
      fields: [
        MultiLineFormField(
          'hiddenReason',
          hint: 'hidden_observation_hint'.tr,
          validator: hiddenReasonValidator,
        ),
      ],
    ),
    TitledSection(
        title: 'patient_observation_title'.tr,
        subtitle: 'patient_observation_subtitle'.tr,
        spacing: innerSectionSpacing,
        padding: _hPadding,
        fields: [
          MultiLineFormField(
            'patientReason',
            hint: 'patient_observation_hint'.tr,
            validator: patientReasonValidator,
          ),
        ]),
    TitledSection(
        title: 'obs_form_new_consultation_title'.tr,
        spacing: innerSectionSpacing,
        fields: [
          ChipSelectorFormField(
            'consultation',
            chips: {
              'obs_consultation_in_person'.tr,
              'obs_consultation_distance'.tr,
              'obs_no_consultation'.tr,
            },
            label: 'obs_form_new_consultation_label'.tr,
          )
        ]),
  ],
);
