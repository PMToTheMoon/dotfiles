import 'package:bonemeal/bonemeal.dart';
import 'package:model_generators/model_generators.dart';

final _fieldsBase = {
  jsonField('title', refer('String')),
  jsonField('school', refer('String')),
  jsonField('location', refer('String')),
  jsonField('startDate', refer('DateTime')),
  jsonField('endDate', refer('DateTime?')),
  jsonField('description', refer('String?')),
};

class Background extends Seed {
  @override
  MetaObject grow(BuildContext context) {
    return JsonSerializable(
      'Education',
      {
        jsonField('id', refer('String')),
        ..._fieldsBase,
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
      jsonField('id', refer('String')),
      ...Fields(_fieldsBase).toNullable(),
    });
  }
}
