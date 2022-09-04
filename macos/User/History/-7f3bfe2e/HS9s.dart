import 'package:bonemeal/bonemeal.dart';
import 'package:model_generators/model_generators.dart';
import 'package:output/my_model.dart' as out;

part 'model.bm.dart';

class MyModel extends MetaObject {
  @override
  void build(BuildStep step) {
    final model = Model(
      className: 'MyModel',
      fields: {},
      hooks: myModelHooks,
    );
    model.build(step);
  }
}

@ToHook()
extension MyModelHooks on out.MyModel {
  void displayFr() {
    print("yesya");
  }

  String get test => ":)";
}
