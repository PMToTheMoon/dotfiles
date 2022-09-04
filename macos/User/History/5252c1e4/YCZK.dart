import 'package:bonemeal/bonemeal.dart';
import 'package:model_generators/model_generators.dart';

class ProfessionalExperience extends Seed {
  @override
  MetaObject grow(BuildContext context) {
    return JsonSerializable(
      'ProfessionalExperience',
      {
        jsonField('title', refer('String')),
        jsonField('company', refer('String')),
        jsonField('location', refer('String')),
        jsonField('beginDate', refer('DateTime')),
        jsonField('endDate', refer('DateTime?')),
      },
      methods: [
        method(
          'displayPeriod',
          refer('String', 'package:common/common.dart'),
          requiredParameters: {
            funcParam('context',
                refer('BuildContext', 'package:flutter/material.dart')),
          },
          body: const Code('''
if (endDate == null) {
  return context.l10n.professional_experience_period_ongoing(beginDate);
}
return context.l10n
    .professional_experience_period_ended(beginDate, endDate!);
'''),
        ),
      ],
    );
  }
}
