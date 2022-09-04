import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';
import 'package:ipr/ipr.dart';

final _hPadding =
    refer('const PaddingSmaller.horizontal()', 'package:common/common.dart');

final clotureComplementForm = Form.multiSectional(
  root: 'close_complement_card/',
  subject: 'CloseComplement',
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
        title: 'patient_observation_title'.tr,
        subtitle: 'patient_observation_subtitle'.tr,
        spacing: innerSectionSpacing,
        padding: _hPadding,
        parts: [
          MultiLineFormField(
            'patientReason',
            hint: 'patient_observation_hint'.tr,
            border: false,
          ),
        ]),
  ],
);
