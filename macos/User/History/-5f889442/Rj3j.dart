import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';
import 'package:ipr/ipr.dart';

final _hPadding =
    refer('const PaddingSmaller.horizontal()', 'package:common/common.dart');

final newRapportForm = Form.multiSectional(
  root: 'new_general_rapport_card/',
  subject: 'NewGeneralRapport',
  spacing: outerSectionSpacing,
  sections: [
    SpreadFormSection(
        spacing: innerSectionSpacing,
        padding: _hPadding,
        fields: [
          TextFormField(
            'title',
            label: 'record_title'.tr,
            validator: requiredValidator,
          ),
        ]),
    TitledSection(
      title: 'hidden_observation_title'.tr,
      spacing: innerSectionSpacing,
      padding: _hPadding,
      fields: [
        MultiLineFormField(
          'hiddenReason',
          hint: 'hidden_observation_hint'.tr,
          validator: requiredValidator,
          border: false,
        ),
      ],
    ),
    TitledSection(
        title: 'obs_rapport_title'.tr,
        subtitle: 'obs_rapport_subtitle'.tr,
        spacing: innerSectionSpacing,
        padding: _hPadding,
        fields: [
          MultiLineFormField(
            'rapport',
            hint: 'obs_rapport_hint'.tr,
            validator: patientReasonValidator,
            border: false,
          ),
        ]),
    SpreadFormSection(
      spacing: innerSectionSpacing,
      fields: [
        ChipSelectorFormField(
          'consultation',
          padding: _hPadding,
          title: 'obs_form_new_consultation_title'.tr,
          chips: {
            'obs_consultation_in_person'.tr,
            'obs_consultation_distance'.tr,
            'obs_no_consultation'.tr,
          },
          label: 'obs_form_new_consultation_label'.tr,
          maxChipSelected: 1,
          validator: requiredValidator,
        ),
      ],
    ),
  ],
);
