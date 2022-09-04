import 'package:bonemeal/bonemeal.dart';
import 'package:model_generators/model_generators.dart';

final _fieldsBase = {
  jsonField('title', refer('String'), name: 'job'),
  jsonField('company', refer('String'), name: 'companyName'),
  jsonField('location', refer('String')),
  jsonField('startDate', refer('DateTime'), name: 'startingDate'),
  jsonField('endDate', refer('DateTime?')),
  jsonField('description', refer('String?'), name: 'jobDescription'),
};

class ProfessionalExperience extends Seed {
  @override
  MetaObject grow(BuildContext context) {
    return Freezed(
      className: 'ProfessionalExperience',
      types: {
        '': {
          jsonField('id', refer('String'), name: 'proExperienceId'),
          ..._fieldsBase,
        },
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
  return context.l10n.period_ongoing(startDate);
}
return context.l10n
    .period_ended(startDate, endDate!);
'''),
        ),
      ],
    );
  }
}

class NewProfessionalExperience extends Seed {
  @override
  MetaObject grow(BuildContext context) {
    return JsonSerializable(
      'NewProfessionalExperience',
      _fieldsBase,
    );
  }
}

class ProfessionalExperienceUpdate extends Seed {
  @override
  MetaObject grow(BuildContext context) {
    return JsonSerializable('ProfessionalExperienceUpdate', {
      jsonField('id', refer('String'), name: 'proExperienceId'),
      ...Fields(_fieldsBase).toNullable(),
    });
  }
}
