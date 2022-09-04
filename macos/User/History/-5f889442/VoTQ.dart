import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';
import 'package:ipr/ipr.dart';
import 'package:ipr/src/form/body_text_section.dart';

final _hPadding =
    refer('const PaddingSmaller.horizontal()', 'package:common/common.dart');

final patientReasonValidator = refer('''
(value) {
  if (value?.isNotEmpty == true) return null;
  if (_controller.report.text.isNotEmpty == true) {
    return null;
  }
  return context.l10n.patient_observation_error;
}''');

final newRapportForm = Path(
  'new_general_rapport_card/',
  [
    Form(
      subject: 'NewGeneralRapport',
      spacing: outerSectionSpacing,
      parts: [
        TextFormField(
          'title',
          label: 'record_title'.tr,
          validator: requiredValidator,
        ),
        TitledSection(
          title: 'hidden_observation_title'.tr,
          spacing: innerSectionSpacing,
          padding: _hPadding,
          parts: [
            MultiLineFormField(
              'hiddenReason',
              hint: 'hidden_observation_hint'.tr,
              validator: requiredValidator,
              border: false,
            ),
          ],
        ),
        TitledSection(
            title: 'obs_report_title'.tr,
            subtitle: 'obs_report_subtitle'.tr,
            spacing: innerSectionSpacing,
            padding: _hPadding,
            parts: [
              MultiLineFormField(
                'report',
                hint: 'obs_report_hint'.tr,
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
    )
  ],
);
