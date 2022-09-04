import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';
import 'package:ipr/ipr.dart';
import 'package:ipr/src/form/padding_decoration.dart';

final _hPadding =
    refer('const PaddingSmaller.horizontal()', 'package:common/common.dart');

final clotureComplementForm = Path(
  'close_complement_card/',
  [
    Form(
      subject: 'CloseComplement',
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
    ),
  ],
);
