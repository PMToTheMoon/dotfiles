import 'package:bonemeal/bonemeal.dart';
import 'package:model_generators/model_generators.dart';
import 'package:output/lib/my_model.dart';

class MyModel extends MetaObject {
  @override
  void build(BuildStep step) {
    final model = Model(className: 'MyModel', fields: {});
    model.build(step);
  }
}
