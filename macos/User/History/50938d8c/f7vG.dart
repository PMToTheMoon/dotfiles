import 'package:bonemeal/bonemeal.dart';
import 'package:model_generators/model_generators.dart';

class AtomicModel extends Seed {
  @override
  MetaObject grow(BuildContext context) {
    return Model(className: 'AtomicModel', fields: {});
  }
}

class ParentModel extends Seed {
  final AtomicModel model;

  ParentModel(this.model);

  @override
  MetaObject grow(BuildContext context) {
    return Model(className: 'ParentModel', fields: {});
  }
}

class NestedModels extends Seed {
  @override
  MetaObject grow(BuildContext context) {
    final atomic = AtomicModel();

    return Path('models/', [
      ParentModel(atomic),
      atomic,
    ]);
  }
}
