import 'dart:js';

import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';
import 'package:ipr/ipr.dart';

final newObservationForm = Form.multiSectional(
  root: 'lib/record/hub/observations/widgets',
  subject: 'NewObservation',
  spacing: outerSectionSpacing,
  sections: [
    SpreadFormSection(spacing: innerSectionSpacing, fields: fields)
    TitledSection(
      title: '',
      fields: fields,
      spacing: spacing,
    ),
  ],
);
