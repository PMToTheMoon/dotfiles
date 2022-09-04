import 'package:bonemeal/bonemeal.dart';
import 'package:model_generators/model_generators.dart';

class Background extends Seed {
  @override
  MetaObject grow(BuildContext context) {
    return JsonSerializable(
      'ProfessionalExperience',
      {
        jsonField('id', refer('String')),
        jsonField('title', refer('String')),
        jsonField('school', refer('String')),
        jsonField('location', refer('String')),
        jsonField('beginDate', refer('DateTime')),
        jsonField('endDate', refer('DateTime?')),
        jsonField('description', refer('String?')),
      },
      methods: [
        method(
          'displayPeriod',
          refer('String', 'package:translations/translations.dart'),
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
