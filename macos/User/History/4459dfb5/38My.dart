import 'package:bonemeal/bonemeal.dart';
import 'package:model_generators/model_generators.dart';

class Skill extends Seed {
  @override
  MetaObject grow(BuildContext context) {
    return JsonSerializable("Skill", {
      jsonField(
        'name',
        refer('String'),
        name: 'skillName',
      ),
    });
  }
}
