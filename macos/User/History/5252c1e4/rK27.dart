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
      methods: [],
    );
  }
}
