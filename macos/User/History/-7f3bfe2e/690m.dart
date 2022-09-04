import 'package:bonemeal/bonemeal.dart';
import 'package:model_generators/model_generators.dart';

class MyModel extends MetaObject {
  @override
  void build(BuildStep step) {
    final model = Model(className: 'MyModel', fields: {});
    model.build(step);
  }
}
