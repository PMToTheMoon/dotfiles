import 'package:form_generator/form_generator.dart';

import 'package:bonemeal/bonemeal.dart';
import 'package:bonemeal_runner/bonemeal_runner.dart';
import 'package:form_generator/form_generator.dart';


import 'chip_editor_form_field.dart';
import 'multi_line_form_field.dart';
import 'titled_section.dart';

extension ToL10nCall on String {
  Expression get tr => refer('context.l10n.$this');
}

final requiredValidator =
    refer('FormBuilderValidators.required(errorText: context.l10n.required_error)');

final hiddenReasonValidator = refer('''
(value) {
  if (value?.isNotEmpty == true) return null;
  if (_controller.patientReason.text.isNotEmpty == true) {
    return null;
  }
  return context.l10n.hidden_reason_error;
}''');

final patientReasonValidator = refer('''
(value) {
  if (value?.isNotEmpty == true) return null;
  if (_controller.hiddenReason.text.isNotEmpty == true) {
    return null;
  }
  return context.l10n.patient_reason_error;
}''');

final form = Form.multiSectional(
    root: 'lib/record/new_record/general/initial_observation/widgets',
    subject: 'GeneralInitialObservation',
    // dependencies: const Dependencies([
    //   CustomDependency("import 'package:common/common.dart';"),
    //   CustomDependency("import 'package:flutter/services.dart';"),
    //   CustomDependency(
    //       "import 'package:form_builder_validators/form_builder_validators.dart';"),
    // ]),
    sections: [
      TitledSection(
        title: 'record_title'.tr,
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
          title: 'hidden_reason_title'.tr,
          subtitle: 'hidden_reason_subtitle'.tr,
          fields: [
            MultiLineFormField(
              'hiddenReason',
              hint: 'hidden_reason_hint'.tr,
              validator: hiddenReasonValidator,
            ),
          ]),
      TitledSection(
          title: 'patient_reason_title'.tr,
          subtitle: 'patient_reason_subtitle'.tr,
          fields: [
            MultiLineFormField(
              'patientReason',
              hint: 'patient_reason_hint'.tr,
              validator: patientReasonValidator,
            ),
          ]),
      // ColumnFormSection(
      //   title: 'clinical_exam_title'.tr,
      //   required: true,
      //   fields: [
      //     IntFormField(
      //       'weight',
      //       label: 'weight_hint'.tr,
      //       validator: requiredValidator,
      //       nullable: false,
      //     ),
      //     IntFormField(
      //       'height',
      //       label: 'height_hint'.tr,
      //       validator: requiredValidator,
      //       nullable: false,
      //     ),
      //     IntFormField('pas', label: 'pas_hint'.tr),
      //     IntFormField('pad', label: 'pad_hint'.tr),
      //     DoubleFormField('temperature', label: 'temperature_hint'.tr),
      //     IntFormField('heartRate', label: 'heart_rate_hint'.tr),
      //   ],
      // ),
      TitledSection(title: 'medical_history_title'.tr, fields: [
        ChipEditorFormField(
          'medicalHistory',
          label: 'medical_history_hint'.tr,
        ),
      ]),
      TitledSection(title: 'symptoms_title'.tr, fields: [
        ChipEditorFormField(
          'symptoms',
          label: 'symptoms_hint'.tr,
        ),
      ]),
      TitledSection(title: 'treatment_title'.tr, fields: [
        ChipEditorFormField(
          'treatment',
          label: 'treatment_hint'.tr,
        ),
      ]),
      TitledSection(title: 'additional_examinations_title'.tr, fields: [
        MultiLineFormField(
          'additional_examinations',
          hint: 'additional_examinations_hint'.tr,
        ),
      ]),
    ],
  ));
}