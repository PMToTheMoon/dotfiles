import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';
import 'package:ipr/ipr.dart';

final newObservationForm = Form.multiSectional(
  root: 'lib/record/hub/observations/widgets',
  subject: 'NewObservation',
  spacing: outerSectionSpacing,
  sections: [
    TitledSection(
      title: title,
      fields: fields,
      spacing: spacing,
    ),
  ],
);
