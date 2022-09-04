import 'package:bonemeal/bonemeal.dart';
import 'package:model_generators/model_generators.dart';
import 'package:output/my_model.dart' as out;

class MyModel extends MetaObject {
  @override
  void build(BuildStep step) {
    final model = Model(className: 'MyModel', fields: {});
    model.build(step);
  }
}
