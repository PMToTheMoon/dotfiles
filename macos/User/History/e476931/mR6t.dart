import 'dart:js';

import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';
import 'package:ipr/ipr.dart';

final newObservationForm = Form.multiSectional(
  root: 'lib/record/hub/observations/widgets',
  subject: 'NewObservation',
  spacing: outerSectionSpacing,
  sections: [
    SpreadFormSection(spacing: innerSectionSpacing, fields: [
      TextFormField('title', label: 'record_title'.tr),
    ]),
    TitledSection(
      title: 'hidden_observation_title'.tr,
      spacing: innerSectionSpacing,
      fields: [
        MultiLineFormField(
          'hiddenReason',
          hint: 'hidden_observation_hint'.tr,
          validator: hiddenReasonValidator,
        ),
      ],
    ),
  ],
);
