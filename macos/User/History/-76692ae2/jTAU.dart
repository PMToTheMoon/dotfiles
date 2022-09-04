import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';
import 'package:ipr/ipr.dart';

final _hPadding =
    refer('const PaddingSmaller.horizontal()', 'package:common/common.dart');

final newComplementForm = Path(
  'new_complement_card/',
  [
    Form(
      subject: 'NewComplement',
      spacing: outerSectionSpacing,
      parts: [
        WrapSectionWithPadding(
          padding: _hPadding,
          child: TextFormField(
            'title',
            label: 'record_title'.tr,
            validator: requiredValidator,
          ),
        ),
        TitledSection(
          title: 'hidden_observation_title'.tr,
          spacing: innerSectionSpacing,
          padding: _hPadding,
          parts: [
            MultiLineFormField(
              'hiddenReason',
              hint: 'hidden_observation_hint'.tr,
              validator: hiddenReasonValidator,
              border: false,
            ),
          ],
        ),
        TitledSection(
            title: 'patient_observation_title'.tr,
            subtitle: 'patient_observation_subtitle'.tr,
            spacing: innerSectionSpacing,
            padding: _hPadding,
            parts: [
              MultiLineFormField(
                'patientReason',
                hint: 'patient_observation_hint'.tr,
                validator: patientReasonValidator,
                border: false,
              ),
            ]),
        BodyTextSection(
          title: 'obs_form_new_consultation_title'.tr,
          body: 'obs_form_new_consultation_label'.tr,
          padding: _hPadding,
        ),
        ChipSelectorFormField(
          'consultation',
          padding: _hPadding,
          chips: {
            'obs_consultation_in_person'.tr,
            'obs_consultation_distance'.tr,
            'obs_no_consultation'.tr,
          },
          maxChipSelected: 1,
          validator: requiredValidator,
        ),
      ],
    ),
  ],
);
